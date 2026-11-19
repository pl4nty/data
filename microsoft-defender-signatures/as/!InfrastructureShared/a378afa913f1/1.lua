-- Threat: !InfrastructureShared
-- Name: a378afa913f1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
