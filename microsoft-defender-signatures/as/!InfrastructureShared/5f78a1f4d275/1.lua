-- Threat: !InfrastructureShared
-- Name: 5f78a1f4d275
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
