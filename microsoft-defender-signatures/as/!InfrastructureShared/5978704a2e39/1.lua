-- Threat: !InfrastructureShared
-- Name: 5978704a2e39
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
