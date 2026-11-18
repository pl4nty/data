-- Threat: !InfrastructureShared
-- Name: 3a78398962e2
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
