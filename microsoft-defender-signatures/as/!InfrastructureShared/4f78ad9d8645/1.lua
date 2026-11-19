-- Threat: !InfrastructureShared
-- Name: 4f78ad9d8645
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
