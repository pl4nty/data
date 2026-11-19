-- Threat: !InfrastructureShared
-- Name: 6078c91937ba
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
