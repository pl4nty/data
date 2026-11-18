-- Threat: !InfrastructureShared
-- Name: 6b78a095bd00
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
