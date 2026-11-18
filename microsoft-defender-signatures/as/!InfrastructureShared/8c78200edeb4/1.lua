-- Threat: !InfrastructureShared
-- Name: 8c78200edeb4
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
