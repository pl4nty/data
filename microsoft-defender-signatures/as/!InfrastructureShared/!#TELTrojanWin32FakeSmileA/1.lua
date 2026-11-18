-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/FakeSmile.A
-- Type: 13
-- MpAttributes: HSTR:Thinstall

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0 == "online interview.exe" then
  return mp.INFECTED
end
return mp.CLEAN
