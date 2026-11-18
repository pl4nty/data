-- Threat: !InfrastructureShared
-- Name: 1e789cfa0cfc
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
