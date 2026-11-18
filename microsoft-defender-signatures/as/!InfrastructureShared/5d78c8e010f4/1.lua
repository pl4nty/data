-- Threat: !InfrastructureShared
-- Name: 5d78c8e010f4
-- Type: 21

if peattributes.x86_image and peattributes.hasexports and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
