-- Threat: !InfrastructureShared
-- Name: 5778f4d33701
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
