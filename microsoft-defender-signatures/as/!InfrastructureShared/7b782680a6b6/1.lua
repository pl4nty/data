-- Threat: !InfrastructureShared
-- Name: 7b782680a6b6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
