-- Threat: !InfrastructureShared
-- Name: 2c2b3019e23c3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[16].utf8p2
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[17].utf8p2
end
local l_0_2 = {
  "\\users\\public\\.+",
  "\\users\\.+\\appdata\\roaming\\.+",
  "\\users\\.+\\appdata\\local\\temp\\.+",
  "\\users\\.+\\appdata\\local\\temp\\7z.+",
  "\\users\\.+\\appdata\\local\\temp\\rar.+",
  "\\users\\.+\\appdata\\local\\temp\\bnz.+",
  "\\device\\cdrom.+",
  "\\device\\mup\\.+"
}
bm_AddRelatedFileFromCommandLine(l_0_0)
if l_0_1 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) then
      for l_0_6, l_0_7 in ipairs(l_0_2) do
        if l_0_5.find(l_0_7) and checkFileLastWriteTime(l_0_5, 300) == false then
          bm.add_related_file(l_0_5)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
