-- Threat: !InfrastructureShared
-- Name: 18616629ba8d
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
