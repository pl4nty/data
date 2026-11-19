-- Threat: !InfrastructureShared
-- Name: 628d865aec79
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MacinstDownloader.A")
  return mp.INFECTED
end
return mp.LOWFI
