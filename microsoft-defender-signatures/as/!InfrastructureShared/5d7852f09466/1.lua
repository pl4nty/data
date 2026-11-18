-- Threat: !InfrastructureShared
-- Name: 5d7852f09466
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
