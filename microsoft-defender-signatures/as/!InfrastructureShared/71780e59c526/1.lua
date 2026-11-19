-- Threat: !InfrastructureShared
-- Name: 71780e59c526
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
