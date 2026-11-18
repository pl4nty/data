-- Threat: !InfrastructureShared
-- Name: 2378972784b5
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
