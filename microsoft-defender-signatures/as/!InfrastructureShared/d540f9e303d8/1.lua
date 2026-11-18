-- Threat: !InfrastructureShared
-- Name: d540f9e303d8
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
