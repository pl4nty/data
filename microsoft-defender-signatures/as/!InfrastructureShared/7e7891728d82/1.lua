-- Threat: !InfrastructureShared
-- Name: 7e7891728d82
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
