-- Threat: !InfrastructureShared
-- Name: 72786c1f4664
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
