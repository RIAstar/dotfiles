import { join } from 'path';
import { defaultConfig } from './default-config.mjs';


const userConfigPath = '.config/promptrc.json';

const loadUserConfig = async () => require(join(process.env.HOME, userConfigPath));

const canMerge = (x, y) => y && typeof x === 'object' && !Array.isArray(x);

const merge = x => y => Object
    .keys(x)
    .reduce((acc, key) => ({ 
        ...acc, 
        [key]: canMerge(x[key], y[key]) ? merge(x[key])(y[key]) : y[key] || x[key]
    }), {});

export const loadConfig = async () => loadUserConfig()
    .then(merge(defaultConfig))
    .catch(() => defaultConfig);

