-- Threat: !InfrastructureShared
-- Name: 8e78904746f3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
