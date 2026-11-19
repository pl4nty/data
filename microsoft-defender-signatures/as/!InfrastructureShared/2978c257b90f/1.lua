-- Threat: !InfrastructureShared
-- Name: 2978c257b90f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
