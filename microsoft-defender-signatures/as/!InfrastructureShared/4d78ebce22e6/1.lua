-- Threat: !InfrastructureShared
-- Name: 4d78ebce22e6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
