-- Threat: !InfrastructureShared
-- Name: 20978d96c4f02
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
