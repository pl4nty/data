-- Threat: !InfrastructureShared
-- Name: 75406b3264bf
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
