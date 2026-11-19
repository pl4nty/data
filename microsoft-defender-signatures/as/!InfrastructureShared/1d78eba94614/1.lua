-- Threat: !InfrastructureShared
-- Name: 1d78eba94614
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
