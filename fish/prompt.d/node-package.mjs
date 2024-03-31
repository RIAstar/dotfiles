import { join } from 'path';


const packageFileName = 'package.json';

const loadPackageJson = async () => require(join(process.cwd(), packageFileName));

export const nodePackage = async () => loadPackageJson()
    .then(({ name, version }) => name + ' v' + version)
    .catch(() => '')

