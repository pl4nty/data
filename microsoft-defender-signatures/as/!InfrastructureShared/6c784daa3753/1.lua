-- Threat: !InfrastructureShared
-- Name: 6c784daa3753
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
