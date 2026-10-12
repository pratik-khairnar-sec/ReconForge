const fs = require('fs');
const { execSync } = require('child_process');

const html = fs.readFileSync('index.html', 'utf8');
const scriptRegex = /<script(?:\s+[^>]*)?>([\s\S]*?)<\/script>/gi;
let match;
let count = 0;
let errors = 0;

while ((match = scriptRegex.exec(html)) !== null) {
  const fullTag = match[0];
  if (fullTag.includes('application/json')) continue;
  count++;
  const code = match[1];
  const tmpFile = `temp_script_${count}.js`;
  fs.writeFileSync(tmpFile, code, 'utf8');
  try {
    execSync(`node --check ${tmpFile}`);
    console.log(`Script block #${count}: SYNTAX PASS`);
  } catch (err) {
    console.error(`Script block #${count}: SYNTAX ERROR:`, err.message);
    errors++;
  } finally {
    if (fs.existsSync(tmpFile)) fs.unlinkSync(tmpFile);
  }
}

console.log(`\nValidation complete: ${count} script blocks tested, ${errors} errors.`);
if (errors > 0) process.exit(1);
