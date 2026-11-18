-- Threat: !InfrastructureShared
-- Name: 3278e124c332
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
