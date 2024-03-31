import { run } from './command.mjs';
import { parseDivergences } from './divergence.mjs';
import { parseStatus } from './status.mjs';


export const isRepo = run('isRepo', error => !error);
export const getActiveBranch = run('getActiveBranch', (_, name) => name);
export const getStatus = run('getStatus', (_, statusOutput) => parseStatus(statusOutput));
export const countDivergences = run('countDivergences', (_, divergenceOutput) => parseDivergences(divergenceOutput));

