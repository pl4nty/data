-- Threat: !InfrastructureShared
-- Name: 3f7824c02ebb
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
