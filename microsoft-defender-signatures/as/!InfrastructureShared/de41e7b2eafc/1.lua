-- Threat: !InfrastructureShared
-- Name: de41e7b2eafc
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
