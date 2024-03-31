export const directory = async ({ homeChar }) => 
    process.cwd().replace(process.env.HOME, homeChar);

