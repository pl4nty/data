-- Threat: !InfrastructureShared
-- Name: 5a788790448a
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 1800000 and mp.getfilesize() < 2900000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
