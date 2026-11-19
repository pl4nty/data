-- Threat: !InfrastructureShared
-- Name: 7578f4c4e6b9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
