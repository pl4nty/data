-- Threat: !InfrastructureShared
-- Name: 6d781282ca49
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
