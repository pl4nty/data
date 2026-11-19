-- Threat: !InfrastructureShared
-- Name: 4078ed1861e1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
