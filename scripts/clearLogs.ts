import { rm } from "fs/promises";
import { readdir } from "fs/promises";
import colors from "chalk"

const dir = await readdir("./", {
  recursive: true
})
const logs = dir.filter(x => /[^\\]+\\logs\\log-\d+-\d+_\d+_\d+\.txt/.test(x))

console.log(colors.cyan(`Trying to delete ${logs.length} files`))
for (const [index, lFile] of logs.entries()) {
  await rm(lFile)
  console.log(colors.cyan(`${index + 1}/${logs.length}`), colors.red(lFile))
}
console.log(colors.green("DONE :D"))