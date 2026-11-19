-- Threat: !InfrastructureShared
-- Name: 4378f3b8ce0c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
