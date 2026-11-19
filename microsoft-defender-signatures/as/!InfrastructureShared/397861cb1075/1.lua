-- Threat: !InfrastructureShared
-- Name: 397861cb1075
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
