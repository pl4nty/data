-- Threat: !InfrastructureShared
-- Name: 96b3e93a7298
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_1 = {
  ":\\perflogs\\",
  ":\\users\\all users\\",
  ":\\users\\default\\",
  ":\\users\\public\\",
  ":\\windows\\temp\\",
  "\\appdata\\local\\",
  "\\appdata\\roaming\\",
  "%appdata%",
  "%public%"
}
local l_0_2 = {
  "/create /tn tvinstallrestore /tr",
  "kontur.dostup abonent updater",
  "utorrent",
  ".xml",
  "retoolclient",
  "fastping"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
