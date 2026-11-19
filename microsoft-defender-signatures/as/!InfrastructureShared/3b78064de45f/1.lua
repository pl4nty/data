-- Threat: !InfrastructureShared
-- Name: 3b78064de45f
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
