-- Threat: !InfrastructureShared
-- Name: 3378debfae0e
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
