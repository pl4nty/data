-- Threat: !InfrastructureShared
-- Name: 15878056e8ef5
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
