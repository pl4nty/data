-- Threat: !InfrastructureShared
-- Name: 347806479e87
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
