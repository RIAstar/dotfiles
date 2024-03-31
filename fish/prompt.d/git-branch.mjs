import { getActiveBranch, isRepo } from './git/index.mjs';


export const gitBranch = async ({ char }) => 
    isRepo().then(itIs => itIs ? getActiveBranch().then(branch => char + ' ' + branch.trim()) : '');

