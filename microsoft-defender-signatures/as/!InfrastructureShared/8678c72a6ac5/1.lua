-- Threat: !InfrastructureShared
-- Name: 8678c72a6ac5
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
