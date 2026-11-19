-- Threat: !InfrastructureShared
-- Name: 4878e26603d3
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
