-- Threat: !InfrastructureShared
-- Name: c278c2f2f9f8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
