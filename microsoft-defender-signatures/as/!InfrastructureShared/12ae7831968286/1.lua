-- Threat: !InfrastructureShared
-- Name: 12ae7831968286
-- Type: 21

if mp.HSTR_WEIGHT >= 101 and mp.HSTR_WEIGHT % 100 ~= 0 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:TrojanDownloader:Win32/Onkods_Lowfi")
return mp.CLEAN
