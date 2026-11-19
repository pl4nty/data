-- Threat: !InfrastructureShared
-- Name: b961ed6273cb
-- Type: 21

if peattributes.isdll and peattributes.executble_image then
  return mp.INFECTED
end
return mp.CLEAN
