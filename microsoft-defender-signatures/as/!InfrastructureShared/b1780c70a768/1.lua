-- Threat: !InfrastructureShared
-- Name: b1780c70a768
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
