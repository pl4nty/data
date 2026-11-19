-- Threat: !InfrastructureShared
-- Name: 12540c3e57b9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
