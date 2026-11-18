-- Threat: !InfrastructureShared
-- Name: cb7898cb3190
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
