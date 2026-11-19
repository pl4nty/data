-- Threat: !InfrastructureShared
-- Name: 7b78bcaf1299
-- Type: 21

if peattributes.isdll and peattributes.executble_image and peattributes.isvbnative then
  return mp.INFECTED
end
return mp.CLEAN
