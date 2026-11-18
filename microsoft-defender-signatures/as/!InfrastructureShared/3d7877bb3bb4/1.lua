-- Threat: !InfrastructureShared
-- Name: 3d7877bb3bb4
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
