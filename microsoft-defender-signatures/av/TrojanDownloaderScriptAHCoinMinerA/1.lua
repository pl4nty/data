-- Threat: TrojanDownloader:Script/AHCoinMiner.A
-- Type: 9

if not mp.get_mpattribute("STATIC:TrojanDownloader:Script/AHCoinMiner.A!AHK") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("^%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%l%.exe$") == 1 then
  return mp.INFECTED
end
return mp.CLEAN
