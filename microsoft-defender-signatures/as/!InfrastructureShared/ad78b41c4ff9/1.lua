-- Threat: !InfrastructureShared
-- Name: ad78b41c4ff9
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
