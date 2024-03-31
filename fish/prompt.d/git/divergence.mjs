export const parseDivergences = s => (s
    .match(/\d/g) || [])
    .map(x => parseInt(x))
    .reverse();

