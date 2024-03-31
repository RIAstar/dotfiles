export const format = ({ prefix = '', suffix = '', style = s => s }) => s => s ? typeof s === 'string' ?
    prefix + style(s) + suffix :
    prefix + style(s.info)(s.s) + suffix :
    '';

