-- Threat: !InfrastructureShared
-- Name: 7c7868ca1b5f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
