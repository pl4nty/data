-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Linkfector.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_2 == "link.exe" and string.lower(string.sub(l_0_1, -4)) == "\\x86" or string.lower(string.sub(l_0_1, -6)) == "\\amd64" then
    return mp.INFECTED
  end
end
return mp.CLEAN
