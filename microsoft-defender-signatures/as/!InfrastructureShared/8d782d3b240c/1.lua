-- Threat: !InfrastructureShared
-- Name: 8d782d3b240c
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
