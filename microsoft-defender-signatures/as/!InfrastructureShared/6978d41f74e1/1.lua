-- Threat: !InfrastructureShared
-- Name: 6978d41f74e1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
