-- Threat: !InfrastructureShared
-- Name: 597823216f1d
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
