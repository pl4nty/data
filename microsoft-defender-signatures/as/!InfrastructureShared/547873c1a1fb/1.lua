-- Threat: !InfrastructureShared
-- Name: 547873c1a1fb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
