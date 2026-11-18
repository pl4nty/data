-- Threat: !InfrastructureShared
-- Name: 4878561d8211
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
