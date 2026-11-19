-- Threat: !InfrastructureShared
-- Name: c5406d3b9d17
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
