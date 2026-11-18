-- Threat: !InfrastructureShared
-- Name: a678c1b6e5f0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
