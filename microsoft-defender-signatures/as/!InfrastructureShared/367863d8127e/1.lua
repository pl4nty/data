-- Threat: !InfrastructureShared
-- Name: 367863d8127e
-- Type: 21

if peattributes.suspicious_image_version and peattributes.lastscn_writable and peattributes.lastscn_executable then
  return mp.INFECTED
end
return mp.CLEAN
