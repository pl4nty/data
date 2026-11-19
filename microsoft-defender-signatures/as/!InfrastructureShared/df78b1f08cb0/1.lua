-- Threat: !InfrastructureShared
-- Name: df78b1f08cb0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
