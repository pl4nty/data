-- Threat: !InfrastructureShared
-- Name: f17872d3f206
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
