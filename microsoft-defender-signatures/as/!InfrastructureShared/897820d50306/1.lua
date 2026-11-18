-- Threat: !InfrastructureShared
-- Name: 897820d50306
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
