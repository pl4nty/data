-- Threat: !InfrastructureShared
-- Name: 85b39982a200
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
local l_0_1 = string.lower(bm.get_imagepath())
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "\\windows\\system32\\svchost.exe", 1, true) or string.find(l_0_1, "\\sources\\setup", 1, true) or string.find(l_0_1, "\\windows\\system32\\winsat.exe", 1, true) or string.find(l_0_1, "\\windows\\system32\\csrss.exe", 1, true) or string.find(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\", 1, true) or string.find(l_0_1, "\\programdata\\bomgar", 1, true) or string.find(l_0_1, "\\macromed\\flash", 1, true) or string.find(l_0_1, "\\microsoft\\visualstudio\\", 1, true) or string.find(l_0_1, "\\windows\\ccm", 1, true) or string.find(l_0_1, "\\windows\\regedit.exe", 1, true) or string.find(l_0_1, "\\setup.exe", 1, true) or string.find(l_0_1, "}\\.cr\\", 1, true) or string.find(l_0_1, "\\appdata\\local\\logmein", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "\\programdata\\package cache\\", 1, true) or string.find(l_0_2, "\\advpack.dll,delnoderundll32", 1, true) or string.find(l_0_2, "\\appdata\\local\\microsoft\\onedrive\\", 1, true) or string.find(l_0_2, "}\\.cr\\", 1, true) or string.find(l_0_2, "\\setup.exe", 1, true) or string.find(l_0_2, "ctfmon.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if sysio.IsFileExists(l_0_5) then
    bm.add_related_file(l_0_5)
  end
end
return mp.INFECTED
