-- Threat: !InfrastructureShared
-- Name: 4d7857e2e640
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
