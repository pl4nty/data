-- Threat: !InfrastructureShared
-- Name: 4e78fb170ab9
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
