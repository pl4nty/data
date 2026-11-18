-- Threat: !InfrastructureShared
-- Name: 4478854871fd
-- Type: 21

if peattributes.isdll and peattributes.x86_image and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
