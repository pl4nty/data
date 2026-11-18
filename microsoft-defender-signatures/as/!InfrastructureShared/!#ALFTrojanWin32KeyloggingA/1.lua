-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Keylogging.A
-- Type: 13
-- MpAttributes: HSTR:Win32/Keylogging.A & (BM_MZ_FILE | BM_MZ_DLL) & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "\\program files", 1, true) ~= nil or string.find(l_0_1, ":\\windows\\", 1, true) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
