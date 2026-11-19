-- Threat: !InfrastructureShared
-- Name: 997802368ad9
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
