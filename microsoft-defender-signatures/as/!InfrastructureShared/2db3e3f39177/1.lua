-- Threat: !InfrastructureShared
-- Name: 2db3e3f39177
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "shell32", 1, true) ~= nil and string.find(l_0_1, "shellexec_rundll", 1, true) ~= nil and string.find(l_0_1, ":\\programdata\\", 1, true) ~= nil and (string.find(l_0_1, "msiexec", 1, true) ~= nil or string.find(l_0_1, "odbcconf", 1, true) ~= nil or string.find(l_0_1, "control.exe", 1, true) ~= nil) then
      bm_AddRelatedFileFromCommandLine(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
