-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Keylogging.C
-- Type: 13
-- MpAttributes: (HSTR:Win32/Keylogging.A | HSTR:Win32/Keylogging.B) & MpNewlyCreatedHint & (BM_MZ_FILE | BM_MZ_DLL) & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "\\appdata\\", 1, true) ~= nil or string.find(l_0_1, "\\programdata\\", 1, true) ~= nil or string.find(l_0_1, "\\progra~1\\", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
