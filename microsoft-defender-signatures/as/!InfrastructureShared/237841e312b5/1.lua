-- Threat: !InfrastructureShared
-- Name: 237841e312b5
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
