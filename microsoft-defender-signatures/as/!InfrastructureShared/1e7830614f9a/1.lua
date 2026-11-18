-- Threat: !InfrastructureShared
-- Name: 1e7830614f9a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
