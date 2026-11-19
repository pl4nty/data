-- Threat: !InfrastructureShared
-- Name: 4778390b4f25
-- Type: 21

if peattributes.isdll and peattributes.amd64_image and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
