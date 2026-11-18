-- Threat: !InfrastructureShared
-- Name: 1187865df4d9b
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 9218 then
  return mp.INFECTED
end
return mp.CLEAN
