-- Threat: !InfrastructureShared
-- Name: 39783e8261a0
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
