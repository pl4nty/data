-- Threat: !InfrastructureShared
-- Name: 152b3a81d9c1f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
end
local l_0_1 = ""
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  l_0_1 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 then
  l_0_1 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 then
  l_0_1 = string.lower(this_sigattrlog[8].utf8p2)
end
local l_0_2 = {
  "npm install",
  "npm i ",
  "npm ci",
  "yarn install",
  "pnpm install",
  "pnpm i "
}
if not contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "tools/setup",
  "scripts/setup",
  ".github/scripts/precheck"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "node_modules/node-gyp/",
  "node_modules/node-sass/",
  "node_modules/bcrypt/",
  "node_modules/sharp/",
  "node_modules/canvas/"
}
if contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {
  "npm install --workspaces",
  "pnpm -r install",
  "pnpm install --filter"
}
if contains(l_0_0, l_0_5) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = pcall(reportBmInfo)
if not l_0_6 and l_0_7 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_7), bm.RelatedStringBMReport)
end
return mp.INFECTED
