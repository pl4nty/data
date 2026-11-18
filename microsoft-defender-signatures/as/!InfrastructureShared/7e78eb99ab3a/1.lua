-- Threat: !InfrastructureShared
-- Name: 7e78eb99ab3a
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
