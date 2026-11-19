-- Threat: !InfrastructureShared
-- Name: 7e780024f5f3
-- Type: 21

if peattributes.has_msilresources and peattributes.x86_image and peattributes.executable_image then
  return mp.INFECTED
end
return mp.CLEAN
