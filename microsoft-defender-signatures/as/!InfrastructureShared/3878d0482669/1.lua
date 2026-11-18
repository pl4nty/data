-- Threat: !InfrastructureShared
-- Name: 3878d0482669
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
