-- Threat: !InfrastructureShared
-- Name: 31785c2e77b2
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
