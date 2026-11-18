-- Threat: !InfrastructureShared
-- Name: 2a7850ea6814
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
