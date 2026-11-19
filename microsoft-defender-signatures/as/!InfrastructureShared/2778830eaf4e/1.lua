-- Threat: !InfrastructureShared
-- Name: 2778830eaf4e
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
