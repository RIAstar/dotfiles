export const status = async ({ char }) => ({
    info: Number(process.argv[2]) === 0,
    s: char
});

