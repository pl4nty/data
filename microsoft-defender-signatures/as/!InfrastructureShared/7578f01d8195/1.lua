-- Threat: !InfrastructureShared
-- Name: 7578f01d8195
-- Type: 21

if mp.getfilesize() > 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
