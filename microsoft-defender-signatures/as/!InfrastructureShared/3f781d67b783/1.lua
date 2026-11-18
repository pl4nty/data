-- Threat: !InfrastructureShared
-- Name: 3f781d67b783
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
