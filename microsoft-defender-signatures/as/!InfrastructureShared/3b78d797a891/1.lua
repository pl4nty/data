-- Threat: !InfrastructureShared
-- Name: 3b78d797a891
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
