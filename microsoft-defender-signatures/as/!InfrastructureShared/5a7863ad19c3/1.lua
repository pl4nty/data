-- Threat: !InfrastructureShared
-- Name: 5a7863ad19c3
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
