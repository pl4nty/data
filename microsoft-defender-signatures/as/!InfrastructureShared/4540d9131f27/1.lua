-- Threat: !InfrastructureShared
-- Name: 4540d9131f27
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
