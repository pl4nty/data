-- Threat: !InfrastructureShared
-- Name: 7db359c6a060
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
local l_0_1 = string.lower(bm.get_imagepath())
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "\\windows\\system32\\svchost.exe", 1, true) or string.find(l_0_1, "\\sources\\setup", 1, true) or string.find(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\onedrive.exe", 1, true) or string.find(l_0_1, "\\appdata\\local\\perfservice\\perfservice.exe", 1, true) or string.find(l_0_1, "\\microsoft\\teams\\current\\teams.exe", 1, true) or string.find(l_0_1, "\\programdata\\bomgar", 1, true) or string.find(l_0_1, "\\windows\\regedit.exe", 1, true) or string.find(l_0_1, "\\appdata\\local\\google\\update\\", 1, true) or string.find(l_0_1, "\\sophos\\autoupdate\\cache\\", 1, true) or string.find(l_0_1, "\\msiexec.exe", 1, true) or string.find(l_0_1, "dellsystemdetect.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "\\microsoft.compute.", 1, true) or string.find(l_0_2, "\\appdata\\local\\google\\update\\", 1, true) or string.find(l_0_2, "\\bginfo.exe", 1, true) or string.find(l_0_2, "\\dwrcst.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if sysio.IsFileExists(l_0_5) then
    bm.add_related_file(l_0_5)
    if not MpCommon.QueryPersistContext(l_0_5, "T1547.001") then
      MpCommon.AppendPersistContext(l_0_5, "T1547.001", 0)
    end
  end
end
return mp.INFECTED
