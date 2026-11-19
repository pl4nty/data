-- Threat: !InfrastructureShared
-- Name: 18d784cf572b7
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
