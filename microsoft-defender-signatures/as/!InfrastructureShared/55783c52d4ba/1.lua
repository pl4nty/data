-- Threat: !InfrastructureShared
-- Name: 55783c52d4ba
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
