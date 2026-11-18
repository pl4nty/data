-- Threat: !InfrastructureShared
-- Name: 5a787e5c585f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
