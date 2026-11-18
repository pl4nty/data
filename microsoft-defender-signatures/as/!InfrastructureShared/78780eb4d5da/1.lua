-- Threat: !InfrastructureShared
-- Name: 78780eb4d5da
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
