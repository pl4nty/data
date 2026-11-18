-- Threat: !InfrastructureShared
-- Name: 6678e00a005e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
