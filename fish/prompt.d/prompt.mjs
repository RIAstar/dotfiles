import { format } from './format.mjs';


const formatToken = config => async name => {
    const templateConfig = config[name];
    const module = await import(`./${name}.mjs`);
    const fn = name.replace(/-(\w+)/g, (_, [head, ...tail]) => head.toUpperCase() + tail.join(''));
    const template = module[fn];
    return format(templateConfig)(await template(templateConfig));
};

export const prompt = async config => Promise
    .all(config.prompt.tokens.map(formatToken(config)))
    .then(tokens => tokens.filter(Boolean).join(' '))
    .then(format(config.prompt));

