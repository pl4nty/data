-- Threat: !InfrastructureShared
-- Name: 4c783e5e9d11
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
