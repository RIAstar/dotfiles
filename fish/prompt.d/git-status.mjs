import { countDivergences, getStatus, isRepo } from './git/index.mjs';


const getStatusOutput = ({ char, separator, showCount }) => status => Object
    .keys(status)
    .reduce((outs, statusKey) => status[statusKey] ? [ ...outs, (showCount ? status[statusKey] : '') + char[statusKey]] : outs, [])
    .join(separator);

const getDivergenceOutput = ({ char }) => ([ahead, behind]) => {
    if (ahead && behind) return ahead + char.diverged + behind;
    if (ahead) return ahead + char.ahead;
    if (behind) return behind + char.behind;
    return '';
};

const getOutput = options => data => [getStatusOutput, getDivergenceOutput]
    .map(getOutput => getOutput(options))
    .map((getOutput, index) => getOutput(data[index]))
    .filter(Boolean)
    .join(options.separator);

export const gitStatus = async options => 
    isRepo().then(itIs => itIs ? Promise.all([getStatus(), countDivergences()]).then(getOutput(options)) : '');

