-- Threat: !InfrastructureShared
-- Name: 7778a2fcd273
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
