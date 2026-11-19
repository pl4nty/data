-- Threat: !InfrastructureShared
-- Name: 44784a1d76c0
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
