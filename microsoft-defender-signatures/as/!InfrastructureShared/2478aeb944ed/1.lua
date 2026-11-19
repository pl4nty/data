-- Threat: !InfrastructureShared
-- Name: 2478aeb944ed
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
