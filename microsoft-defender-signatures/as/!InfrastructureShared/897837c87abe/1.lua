-- Threat: !InfrastructureShared
-- Name: 897837c87abe
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
