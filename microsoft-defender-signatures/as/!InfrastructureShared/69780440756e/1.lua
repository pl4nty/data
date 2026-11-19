-- Threat: !InfrastructureShared
-- Name: 69780440756e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
