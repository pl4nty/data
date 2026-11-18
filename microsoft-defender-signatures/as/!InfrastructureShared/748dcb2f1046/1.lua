-- Threat: !InfrastructureShared
-- Name: 748dcb2f1046
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:DownloaderAgent.A")
  return mp.INFECTED
end
return mp.LOWFI
