-- Threat: !InfrastructureShared
-- Name: 377840b55153
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
