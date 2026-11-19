-- Threat: !InfrastructureShared
-- Name: 34781d317833
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
