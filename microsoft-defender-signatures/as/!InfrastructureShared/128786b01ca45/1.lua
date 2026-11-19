-- Threat: !InfrastructureShared
-- Name: 128786b01ca45
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
