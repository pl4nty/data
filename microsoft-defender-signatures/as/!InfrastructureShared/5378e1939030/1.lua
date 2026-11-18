-- Threat: !InfrastructureShared
-- Name: 5378e1939030
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
