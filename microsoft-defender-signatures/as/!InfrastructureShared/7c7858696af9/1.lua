-- Threat: !InfrastructureShared
-- Name: 7c7858696af9
-- Type: 21

if mp.getfilesize() < 160000 then
  return mp.INFECTED
end
return mp.CLEAN
