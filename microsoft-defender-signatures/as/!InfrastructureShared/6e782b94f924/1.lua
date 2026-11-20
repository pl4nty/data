-- Threat: !InfrastructureShared
-- Name: 6e782b94f924
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
