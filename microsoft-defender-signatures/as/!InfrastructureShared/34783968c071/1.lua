-- Threat: !InfrastructureShared
-- Name: 34783968c071
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
