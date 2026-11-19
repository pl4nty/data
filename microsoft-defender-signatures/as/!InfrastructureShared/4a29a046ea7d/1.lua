-- Threat: !InfrastructureShared
-- Name: 4a29a046ea7d
-- Type: 21

if mp.getfilesize() == 64 then
  return mp.INFECTED
end
return mp.CLEAN
