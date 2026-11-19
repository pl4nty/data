-- Threat: !InfrastructureShared
-- Name: 7c7866f1a884
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
