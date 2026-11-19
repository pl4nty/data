-- Threat: !InfrastructureShared
-- Name: a661f85fee65
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
