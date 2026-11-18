-- Threat: !InfrastructureShared
-- Name: e278908e4fb6
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
