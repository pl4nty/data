-- Threat: !InfrastructureShared
-- Name: 317833a25c88
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
