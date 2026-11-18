-- Threat: !InfrastructureShared
-- Name: 5e7853885c9c
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
