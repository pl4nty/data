-- Threat: !InfrastructureShared
-- Name: 587839332b6f
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 2070000 and mp.getfilesize() > 1970000 then
  return mp.INFECTED
end
return mp.CLEAN
