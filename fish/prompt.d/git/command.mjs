import { exec } from 'child_process';


const command = {
    isRepo: 'git rev-parse --is-inside-work-tree',
    getActiveBranch: 'git rev-parse --abbrev-ref HEAD',
    getStatus: 'git status --porcelain'
};
command.countDivergences = `git rev-list --left-right origin/(${command.getActiveBranch})..HEAD --count`;

export const run = (cmd, handler) => () => new Promise(resolve => exec(
    command[cmd],
    { shell: process.env.SHELL },
    (err, resp) => resolve(handler(err, resp))
));

