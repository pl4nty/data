-- Threat: !InfrastructureShared
-- Name: 7a784f2021d6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
