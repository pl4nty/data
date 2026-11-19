-- Threat: !InfrastructureShared
-- Name: 337855ad2f3b
-- Type: 21

if mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
