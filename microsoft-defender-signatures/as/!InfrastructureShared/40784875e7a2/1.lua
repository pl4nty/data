-- Threat: !InfrastructureShared
-- Name: 40784875e7a2
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
