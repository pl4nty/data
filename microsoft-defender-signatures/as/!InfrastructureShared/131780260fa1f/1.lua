-- Threat: !InfrastructureShared
-- Name: 131780260fa1f
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() >= 6000000 then
  return mp.INFECTED
end
return mp.CLEAN
