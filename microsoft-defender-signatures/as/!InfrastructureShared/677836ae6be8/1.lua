-- Threat: !InfrastructureShared
-- Name: 677836ae6be8
-- Type: 21

if peattributes.isdll and peattributes.x86_image and peattributes.hasstandardentry then
  return mp.INFECTED
end
return mp.CLEAN
