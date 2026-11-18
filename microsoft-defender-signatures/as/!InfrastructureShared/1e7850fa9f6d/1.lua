-- Threat: !InfrastructureShared
-- Name: 1e7850fa9f6d
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
