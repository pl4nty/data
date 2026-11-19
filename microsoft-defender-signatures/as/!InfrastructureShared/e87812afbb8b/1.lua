-- Threat: !InfrastructureShared
-- Name: e87812afbb8b
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
