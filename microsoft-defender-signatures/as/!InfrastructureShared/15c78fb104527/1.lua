-- Threat: !InfrastructureShared
-- Name: 15c78fb104527
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
