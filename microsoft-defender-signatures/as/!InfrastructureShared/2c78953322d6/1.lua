-- Threat: !InfrastructureShared
-- Name: 2c78953322d6
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 127490 then
  return mp.INFECTED
end
return mp.CLEAN
