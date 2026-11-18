-- Threat: !InfrastructureShared
-- Name: a9780b627848
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
