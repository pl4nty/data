-- Threat: !InfrastructureShared
-- Name: 200784c68c7b0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
