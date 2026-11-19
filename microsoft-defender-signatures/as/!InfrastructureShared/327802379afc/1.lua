-- Threat: !InfrastructureShared
-- Name: 327802379afc
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
