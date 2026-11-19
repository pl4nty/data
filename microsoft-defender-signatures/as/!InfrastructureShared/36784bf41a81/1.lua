-- Threat: !InfrastructureShared
-- Name: 36784bf41a81
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
