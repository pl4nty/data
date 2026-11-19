-- Threat: !InfrastructureShared
-- Name: 3178ce4c4c55
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 100000 then
  return mp.INFECTED
end
return mp.CLEAN
