-- Threat: !InfrastructureShared
-- Name: 687833f39dcd
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
