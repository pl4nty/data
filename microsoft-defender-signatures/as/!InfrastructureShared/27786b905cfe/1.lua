-- Threat: !InfrastructureShared
-- Name: 27786b905cfe
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
