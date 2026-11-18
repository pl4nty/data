-- Threat: !InfrastructureShared
-- Name: 9678a14d5a91
-- Type: 21

if mp.getfilesize() >= 4096 and mp.getfilesize() <= 5120 then
  return mp.INFECTED
end
return mp.CLEAN
