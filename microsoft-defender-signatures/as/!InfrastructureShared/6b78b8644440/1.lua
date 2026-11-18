-- Threat: !InfrastructureShared
-- Name: 6b78b8644440
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
