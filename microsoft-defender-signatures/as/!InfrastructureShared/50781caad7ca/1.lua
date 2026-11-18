-- Threat: !InfrastructureShared
-- Name: 50781caad7ca
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
