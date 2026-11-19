-- Threat: !InfrastructureShared
-- Name: f5406d74756d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
