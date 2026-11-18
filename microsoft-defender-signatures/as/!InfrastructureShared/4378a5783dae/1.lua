-- Threat: !InfrastructureShared
-- Name: 4378a5783dae
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
