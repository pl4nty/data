-- Threat: !InfrastructureShared
-- Name: f178d863e928
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
