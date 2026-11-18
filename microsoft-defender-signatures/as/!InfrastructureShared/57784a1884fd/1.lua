-- Threat: !InfrastructureShared
-- Name: 57784a1884fd
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and mp.get_mpattribute("TEL:TrojanDownloader:Win32/AdLoad.A!MSR") and 2424832 < l_0_0 and l_0_0 < 2621440 then
  return mp.INFECTED
end
return mp.LOWFI
