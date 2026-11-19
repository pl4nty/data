-- Threat: !InfrastructureShared
-- Name: 73782354f791
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
