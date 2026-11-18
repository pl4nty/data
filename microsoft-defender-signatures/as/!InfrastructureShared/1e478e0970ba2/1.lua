-- Threat: !InfrastructureShared
-- Name: 1e478e0970ba2
-- Type: 21
-- Flags: 1

if peattributes.ismsil ~= true then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT >= 13 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:TrojanDownloader:MSIL/CoinMiner.H_Lowfi")
return mp.CLEAN
