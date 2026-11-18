-- Threat: !InfrastructureShared
-- Name: 9878ca15b065
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
