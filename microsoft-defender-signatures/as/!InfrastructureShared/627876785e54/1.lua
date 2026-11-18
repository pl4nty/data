-- Threat: !InfrastructureShared
-- Name: 627876785e54
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
