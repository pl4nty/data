-- Threat: !InfrastructureShared
-- Name: d2785cca4bbb
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
