-- Threat: !InfrastructureShared
-- Name: 3478659fb6d3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
