-- Threat: !InfrastructureShared
-- Name: 9178c9b22d25
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
