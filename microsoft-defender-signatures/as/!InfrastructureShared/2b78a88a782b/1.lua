-- Threat: !InfrastructureShared
-- Name: 2b78a88a782b
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
