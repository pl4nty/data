-- Threat: !InfrastructureShared
-- Name: 5878d8824d73
-- Type: 21

if mp.getfilesize() < 23000 then
  return mp.INFECTED
end
return mp.CLEAN
