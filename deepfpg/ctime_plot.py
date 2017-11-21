#!/usr/bin/env python3
"""Plot cumulative time taken for DFPG to solve a complement of problems."""

from argparse import ArgumentParser
from itertools import cycle, groupby
from json import load
import re

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import scipy.stats as st

parser = ArgumentParser(
    description="plots of total running time for AAAI'18 paper")
parser.add_argument(
    '--save',
    metavar='PATH',
    type=str,
    default=None,
    help="destination file for graph")
parser.add_argument(
    '--no-legend',
    dest='add_legend',
    default=True,
    action='store_false',
    help='disable legend')
parser.add_argument(
    '--ymin', type=float, default=None, help='minimum extend of y-axis')
parser.add_argument(
    '--ymax', type=float, default=None, help='maximum extent of y-axis')
parser.add_argument(
    '--no-y-annot',
    dest='add_y_annot',
    default=True,
    action='store_false',
    help='disable y-axis label and numbering')
parser.add_argument(
    '--assume-det',
    action='store_true',
    default=False,
    help='assume deterministic problem with integer costs')
parser.add_argument(
    '--legend-cols',
    type=int,
    default=1,
    help="columns for legend (when turned on)")
parser.add_argument(
    '--dims',
    nargs=2,
    type=float,
    metavar=('WIDTH', 'HEIGHT'),
    default=[6, 3],
    help="dimensions (in inches) for saved plot")
parser.add_argument('--title', help='title for the plot')
parser.add_argument(
    '--max-size',
    type=float,
    default=float('inf'),
    help='max problem size to show')
parser.add_argument(
    '--min-size',
    type=float,
    default=-float('inf'),
    help='min problem size to show')
parser.add_argument(
    '--timeout',
    type=float,
    default=9000.0,
    help='time to use for unsuccessful experiments')
parser.add_argument(
    '--panic',
    default=False,
    action='store_true',
    help='enable awful, sinful hacks used to get probabilistic BW to plot '
    'before AAAI')
parser.add_argument(
    'jsons',
    nargs='+',
    help='experiment labels and JSON files in format "label:path"')


def ci95(data):
    # compute 95% CI for some data; see https://stackoverflow.com/a/34474255
    assert len(data) > 1, "need at least two points for CI"
    data = np.asarray(data, dtype=float)
    mu = np.mean(data)
    n = len(data)
    sem = st.sem(data)
    lo, hi = st.t.interval(0.95, n - 1, loc=mu, scale=sem)
    eps = hi - mu
    try:
        assert abs(eps - (mu - lo)) < 1e-5, (eps, lo, mu, hi, n)
    except AssertionError as e:
        # this keeps happening every time the data changes slightly
        import ipdb
        ipdb.set_trace()
        raise e
    # CI is (mean + eps, mean - eps)
    return eps


def reprocess_pbw_data(data):
    """Rewrite probabilistic blocksworld names to work with LaTeX + be
    consistent between ASNet and baselines."""
    # make copy so that we don't ruin original
    data = dict(data)
    name_re = re.compile(r'^prob_bw(_\d+)?_n(?P<n>\d+)_s(?P<s>\d+)$')
    new_names = []
    sizes = []
    seeds = []
    should_keep = []
    for name in data['eval_names']:
        if 'prob_bw_' and '_es' in name:
            # this is from extended set, skip it
            should_keep.append(False)
        else:
            match = name_re.match(name)
            if match is None:
                raise ValueError(
                    "Name '%s' doesn't seem to match PBW template" % name)
            match_d = match.groupdict()
            n = int(match_d['n'])
            s = int(match_d['s'])
            new_name = 'prob-bw-n%d-s%d' % (n, s)
            new_names.append(new_name)
            sizes.append(n)
            seeds.append(s)
            should_keep.append(True)
    num_names = len(should_keep)
    # trim all list-valued items so that only the stuff with valid names is
    # kept
    for remove_key in list(data.keys()):
        right_class = isinstance(data[remove_key], list)
        if right_class and len(data[remove_key]) == num_names:
            data[remove_key] = [
                d for d, k in zip(data[remove_key], should_keep) if k
            ]
    # handle names separately, since we're rewriting them entirely
    data['eval_names'] = new_names
    return data, sizes, seeds


def mask_select(items, bool_mask):
    """Throw out items corresponding to False in bool_mask, and keep others."""
    assert len(items) == len(bool_mask)
    rv = []
    for item, keep in zip(items, bool_mask):
        if keep:
            rv.append(item)
    return rv


def load_inner(expt_str, args):
    try:
        label, path = expt_str.split(':', 1)
    except ValueError as e:
        print('Could not parse label:path pair "%s"', expt_str)
        raise e
    # this is for data that we don't have because one method took forever to
    # solve anything :(
    no_data = path == 'EMPTY'
    if no_data:
        data = {'eval_names': [], 'eval_sizes': [], 'eval_runs': []}
    else:
        # load data
        with open(path, 'r') as fp:
            data = load(fp)
        # reprocess pbw
        if args.panic:
            # probabilistic blocksworld special case
            data, pbw_sizes, pbw_seeds = reprocess_pbw_data(data)
    # sometimes we have more names than sizes for some reasons (probably
    # collate_data is broken)
    num_runs = max(map(len, [data['eval_sizes'], data['eval_runs']]))
    data['eval_names'] = data['eval_names'][:num_runs]
    # we'll also compute some extra stuff we need (mean running time,
    # 95%CI, mean cost, 95%CI)
    costs_per_prob = []
    times_per_prob = []
    cov_per_prob = []
    keep_mask = []
    for size, d in zip(data['eval_sizes'], data['eval_runs']):
        if size < args.min_size or size > args.max_size:
            # skip things we don't care about
            keep_mask.append(False)
            continue
        keep_mask.append(True)
        cov = (np.sum(d['goal_reached']), len(d['goal_reached']))
        cov_per_prob.append(cov)
        # we use only costs when we've reached the goal
        costs_per_prob.append(
            [c if g else None for c, g in zip(d['cost'], d['goal_reached'])])
        # use times for every run, goal or not
        # TODO: cosanostra will have different timeout to rest :/
        # this should really be recorded in the input files!
        if not any(d['goal_reached']):
            # all timeouts? empty time list ensures planners with no coverage
            # are not included in figure.
            times_per_prob.append([])
        else:
            # otherwise include rest as timeouts
            times_per_prob.append(
                [args.timeout if t is None else t for t in d['time']])
        # times_per_prob.append(
        #     [t if g else None for t, g in zip(d['time'], d['goal_reached'])])

        # update eval_sizes, eval_runs, eval_names to get rid of stuff we don't
        # care about
    data['eval_sizes'] = mask_select(data['eval_sizes'], keep_mask)
    try:
        data['eval_names'] = mask_select(data['eval_names'], keep_mask)
    except:
        import ipdb
        ipdb.set_trace()
    data['eval_runs'] = mask_select(data['eval_runs'], keep_mask)

    def get_mean(data):
        data = [d for d in data if d is not None]
        if data is None or not len(data):
            return None
        return np.mean(data)

    def get_ci(data):
        data = [d for d in data if d is not None]
        if data is None or len(data) <= 1 or max(data) == min(data):
            # all cases where this is undefined
            return None
        return ci95(data)

    def lmap(*args, **kwargs):
        return list(map(*args, **kwargs))

    summary = {
        'cost_mean': lmap(get_mean, costs_per_prob),
        'cost_ci': lmap(get_ci, costs_per_prob),
        'time_mean': lmap(get_mean, times_per_prob),
        'time_ci': lmap(get_ci, times_per_prob),
        'cov_pairs': cov_per_prob,
    }
    data['summary'] = summary
    return (label, data)


def load_data(args):
    return [load_inner(expt_str, args) for expt_str in args.jsons]


def merge_overlapped_x(x_vals, y_vals):
    """Take x and y coordinates (expressed as list of x, then list of y) and
    merge them so that things with the same x coordinate are averaged."""
    pairs = zip(x_vals, y_vals)
    # group by x-value
    groups = groupby(pairs, key=lambda t: t[0])
    rv_x = []
    rv_y = []
    for group in groups:
        x_val, rest = group
        y_val = np.mean([p[1] for p in rest])
        rv_x.append(x_val)
        rv_y.append(y_val)
    return rv_x, rv_y


def main():
    args = parser.parse_args()

    # Make the plot look like LaTeX
    matplotlib.rcParams.update({
        'font.family': 'Times',
        'font.serif': 'Times',
        'pgf.rcfonts': False,
        'pgf.texsystem': 'pdflatex',
        'xtick.labelsize': 'x-small',
        'ytick.labelsize': 'x-small',
        'legend.fontsize': 6.5,
        'axes.labelsize': 'small',
        'axes.titlesize': 'medium',
        # ensures that we have only type 42/type 1 fonts, and *no* type
        # 3---important for AAAI (type 42 = TrueType; yes, that's the joke)
        # 'pdf.fonttype': 42,
        # 'ps.fonttype': 42,
        'text.usetex': True,
    })

    results = load_data(args)

    # preproc step: figure out x range
    x_min = float('inf')
    x_max = -float('inf')
    for _, data in results:
        x_vals = data['eval_sizes']
        if x_vals:
            # some problems have no runs
            x_min = min(min(x_vals), x_min)
            x_max = max(max(x_vals), x_max)
    # remove 1 from min x-value for training time
    x_min -= 1

    # actually plot data
    handles = []
    labels = []
    # marker cycle from https://stackoverflow.com/a/13092467
    marker = cycle(('+', 'x', '1', '2', '3', '4', '*', 'o', 's', 'p', 'H'))
    # marker = cycle(('.', ))
    for label, data in results:
        x_vals = []
        y_vals = []
        for idx, size in enumerate(data['eval_sizes']):
            if size > args.max_size or size < args.min_size:
                # don't bother plotting huge or tiny stuff
                continue
            mu = data['summary']['time_mean'][idx]
            if mu is None:
                # skip things for which we couldn't record a time
                continue
            x_vals.append(size)
            y_vals.append(mu)

        x_vals = np.concatenate([[x_min], x_vals])
        # train time initially 0; increase for learning planners
        y_vals = np.concatenate([[0], y_vals])

        if data.get('train_time') is not None:
            # add in training time for learning planners
            train_time = data['train_time']
            y_vals += train_time
        if 'ASNet' in label:
            ls = '-'
        else:
            ls = '--'
        if args.panic:
            # merge things with same x-coordinate by averaging
            x_vals, y_vals = merge_overlapped_x(x_vals, y_vals)
        handle = plt.plot(  # plt.semilogy
            x_vals,
            y_vals,
            label=label,
            marker=next(marker),
            ls=ls,
            lw=1,
            ms=3)

        # keep track of labels and handles for legend
        labels.append(label)
        handles.append(handle)

    # axis labels
    plt.xlabel('Problem size')
    if args.add_y_annot:
        plt.ylabel('Time (s)')  # was log scale
    else:
        # we disable all y annotations, including numbers
        plt.gca().axes.get_yaxis().set_ticklabels([])

    # x ticks with explicit 'train' label
    ax = plt.gca()
    old_xticks = ax.get_xticks()
    to_dump = max(np.nonzero(old_xticks <= x_min)[0]) + 1
    new_xticks = np.concatenate([[x_min], old_xticks[to_dump:]])
    new_xlabels = ['TR'] + ['%d' % a for a in new_xticks[1:]]
    ax.set_xticks(new_xticks)
    ax.set_xticklabels(new_xlabels)
    plt.xlim(x_min, min(x_max, args.max_size))
    y_vals = dict(ymin=0)
    if args.ymin is not None:
        y_vals['ymin'] = args.ymin
    if args.ymax is not None:
        y_vals['ymax'] = args.ymax
    plt.ylim(**y_vals)

    # legend
    if args.add_legend:
        plt.legend(loc='best', ncol=args.legend_cols)
        # legend = plt.figlegend(
        #     handles,
        #     labels,
        #     bbox_to_anchor=(1.15, 0.5),
        #     loc="right",
        #     frameon=False)

    # title
    plt.title(args.title)

    # save or show
    if args.save is None:
        plt.show()
    else:
        print('Saving figure to', args.save)
        plt.gcf().set_size_inches(args.dims)
        plt.tight_layout()
        plt.savefig(
            args.save,
            bbox_inches='tight',
            # bbox_extra_artists=[legend],
            transparent=True)

    # also print out a table (split this code out later)
    # this is actually pretty hard because we have data stored by method, but
    # we need to access it by problem (since we have one row per problem)
    print_table(results, args.assume_det)


def print_table(results, assume_det):
    method_names = set()
    prob_names = set()
    prob_sizes = {}
    # maps (method, prob) tuple to cell contents
    problem_data = {}
    for method_label, data in results:
        summary = data['summary']
        names = data['eval_names']
        # sometimes names longer than sizes for some reason :/
        sizes = data['eval_sizes']
        method_names.add(method_label)
        for prob_idx, prob_name in enumerate(names[:len(sizes)]):
            prob_names.add(prob_name)
            prob_sizes[prob_name] = sizes[prob_idx]
            num_solved, total = summary['cov_pairs'][prob_idx]
            cost_mu = summary['cost_mean'][prob_idx]
            cost_ci = summary['cost_ci'][prob_idx]
            if assume_det:
                # this is deterministic, so just print cost
                if num_solved == 0:
                    cell_contents = '-'
                else:
                    if cost_mu == int(cost_mu):
                        # print whole numbers the pretty way
                        cell_contents = '%d' % cost_mu
                    else:
                        cell_contents = '%.2f' % cost_mu
            else:
                # maybe probabilistic, so need CI for cost, too
                if num_solved == 0:
                    cell_contents = '-'
                elif num_solved == 1:
                    cell_contents = r'\makecell{%d/%d \\ (%.2f)}' \
                                    % (num_solved, total, cost_mu)
                elif not cost_ci:
                    cell_contents = r'\makecell{%d/%d \\ (%.2f $\pm$ 0)}' \
                                    % (num_solved, total, cost_mu)
                else:
                    cell_contents = r"\makecell{%d/%d \\ (%.2f $\pm$ %.2f)}" \
                                    % (num_solved, total, cost_mu, cost_ci)
            # time_mu = summary['time_mean'][prob_idx]
            # time_ci = summary['time_ci'][prob_idx]
            # cell_contents += ' [T] %s (pm %s)' % (time_mu, time_ci)
            problem_data[(method_label, prob_name)] = cell_contents
    method_names = sorted(method_names)
    print('%', ' & '.join(method_names), r'\\')
    prob_names = sorted(prob_names, key=lambda k: prob_sizes[k])
    for prob_name in prob_names:
        print(prob_name)
        # now print results for each method with a preceding "  & "
        for meth_name in sorted(method_names):
            key = (meth_name, prob_name)
            contents = problem_data.get(key, '-')
            print('  & %s %% %s' % (contents, meth_name))
        # linebreak at end
        print(r'  \\')


if __name__ == '__main__':
    main()
