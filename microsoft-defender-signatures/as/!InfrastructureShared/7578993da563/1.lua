-- Threat: !InfrastructureShared
-- Name: 7578993da563
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
