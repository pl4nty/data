-- Threat: !InfrastructureShared
-- Name: 1a7813251167
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
