const statusSymbols = Object.freeze({
    untracked: '\\?\\?',
    added: 'A',
    modified: 'M',
    renamed: 'R',
    deleted: 'D',
    unmerged: 'U'
});

const match = (regex, s) => s.match(regex) || [];
const countStatus = (symbol, s) => match(new RegExp('^\\s*' + symbol, 'gm'), s).length;

export const parseStatus = s => Object
    .keys(statusSymbols)
    .reduce((countMap, key) => ({ 
        ...countMap, 
        [key]: countStatus(statusSymbols[key], s) 
    }), {});

