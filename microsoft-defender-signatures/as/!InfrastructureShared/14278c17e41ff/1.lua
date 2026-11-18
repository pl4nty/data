-- Threat: !InfrastructureShared
-- Name: 14278c17e41ff
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
