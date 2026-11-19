-- Threat: !InfrastructureShared
-- Name: ba78736c4139
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
