-- Threat: !InfrastructureShared
-- Name: 67781e15b82a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
