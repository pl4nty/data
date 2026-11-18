-- Threat: !InfrastructureShared
-- Name: 93787c2f46b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
