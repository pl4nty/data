-- Threat: !InfrastructureShared
-- Name: 26789616cd99
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
