-- Threat: !InfrastructureShared
-- Name: 16b7853530b73
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
