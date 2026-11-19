-- Threat: !InfrastructureShared
-- Name: 4d78cd626071
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
