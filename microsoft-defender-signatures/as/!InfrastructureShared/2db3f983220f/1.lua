-- Threat: !InfrastructureShared
-- Name: 2db3f983220f
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  bm.trigger_sig("PowershellMasqueraded", l_0_0)
  local l_0_1, l_0_2 = l_0_0:match("^(.+\\)([^\\]+)$")
  if l_0_1 and l_0_2 and (string.find(l_0_1, "c:\\users\\", 1, true) or string.find(l_0_1, "\\temp\\", 1, true) or string.find(l_0_1, "\\appdata\\", 1, true) or string.find(l_0_1, "\\programdata\\", 1, true)) and (string.find(l_0_2, ".cmd.exe", 1, true) or string.find(l_0_2, ".bat.exe", 1, true) or string.find(l_0_2, ".vbs.exe", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
