-- Threat: !InfrastructureShared
-- Name: 567850ce7905
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
