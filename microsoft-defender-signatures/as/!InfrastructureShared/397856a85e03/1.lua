-- Threat: !InfrastructureShared
-- Name: 397856a85e03
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
