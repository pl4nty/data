-- Threat: !InfrastructureShared
-- Name: 5178874a9148
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
