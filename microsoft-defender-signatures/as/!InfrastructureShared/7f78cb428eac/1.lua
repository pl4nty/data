-- Threat: !InfrastructureShared
-- Name: 7f78cb428eac
-- Type: 21

if peattributes.no_exports and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
