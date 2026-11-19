-- Threat: !InfrastructureShared
-- Name: 8c781e918279
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
