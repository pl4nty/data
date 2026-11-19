-- Threat: !InfrastructureShared
-- Name: 46785266b774
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
