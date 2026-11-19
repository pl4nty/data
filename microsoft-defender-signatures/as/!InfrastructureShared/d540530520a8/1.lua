-- Threat: !InfrastructureShared
-- Name: d540530520a8
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
