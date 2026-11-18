-- Threat: !InfrastructureShared
-- Name: b661acd691a8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
