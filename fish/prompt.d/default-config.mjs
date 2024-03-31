import chalk from 'chalk';

const { cyan, green, magenta, red, yellow, white } = chalk;

export const defaultConfig = {
    prompt: {
        tokens: [
            'user', 
            'directory',
            'git-branch', 
            'git-status', 
            'node-package', 
            'status'
        ],
        prefix: '\n',
        suffix: ' '
    },
    user: {
        style: yellow
    },
    directory: {
        homeChar: '~',
        prefix: 'in ',
        style: cyan.bold
    },
    status: {
        char: '➜',
        prefix: '\n',
        style: success => success ? green.bold : red.bold
    },
    'git-branch': {
        char: '',
        prefix: 'on ',
        style: magenta.bold
    },
    'git-status': {
        showCount: true,
        char: {
            untracked: '⫰',
            added: '⇸',
            modified: '≃',
            renamed: '↦',
            deleted: '⬰',
            unmerged: '⇹',
            ahead: '⇡',
            behind: '⇣',
            diverged: '↕'
        },
        prefix: '[ ',
        suffix: ' ]',
        separator: white(' ∙ '),
        style: red
    },
    'node-package': {
        prefix: 'is ',
        style: green
    }
};

