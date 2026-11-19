-- Threat: !InfrastructureShared
-- Name: 14540f2ac4e8b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
