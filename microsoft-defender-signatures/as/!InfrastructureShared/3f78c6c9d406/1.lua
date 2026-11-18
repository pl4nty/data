-- Threat: !InfrastructureShared
-- Name: 3f78c6c9d406
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
