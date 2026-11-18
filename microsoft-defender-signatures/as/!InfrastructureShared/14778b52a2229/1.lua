-- Threat: !InfrastructureShared
-- Name: 14778b52a2229
-- Type: 21

if mp.HSTR_WEIGHT >= 21 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:TrojanDownloader:Win32/Krado.A")
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
