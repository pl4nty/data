-- Threat: !InfrastructureShared
-- Name: 8d78165b06ff
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
