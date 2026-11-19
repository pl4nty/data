-- Threat: !InfrastructureShared
-- Name: 10178b4cc85c8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
