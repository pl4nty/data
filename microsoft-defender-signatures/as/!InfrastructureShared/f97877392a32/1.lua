-- Threat: !InfrastructureShared
-- Name: f97877392a32
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
