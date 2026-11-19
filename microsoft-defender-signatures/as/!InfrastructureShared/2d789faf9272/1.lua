-- Threat: !InfrastructureShared
-- Name: 2d789faf9272
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
