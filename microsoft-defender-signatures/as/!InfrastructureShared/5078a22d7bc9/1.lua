-- Threat: !InfrastructureShared
-- Name: 5078a22d7bc9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
