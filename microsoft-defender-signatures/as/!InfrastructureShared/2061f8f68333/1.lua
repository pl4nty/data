-- Threat: !InfrastructureShared
-- Name: 2061f8f68333
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
