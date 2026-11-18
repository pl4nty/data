-- Threat: !InfrastructureShared
-- Name: 2178888ad83e
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
