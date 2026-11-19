-- Threat: !InfrastructureShared
-- Name: 45786dad7a9f
-- Type: 21

if mp.getfilesize() < 160000 then
  return mp.INFECTED
end
return mp.CLEAN
