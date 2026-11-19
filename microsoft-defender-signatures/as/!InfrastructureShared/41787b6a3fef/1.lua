-- Threat: !InfrastructureShared
-- Name: 41787b6a3fef
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
