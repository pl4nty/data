-- Threat: !InfrastructureShared
-- Name: 3a78f8cf8d4c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
