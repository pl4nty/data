-- Threat: !InfrastructureShared
-- Name: 3d7855bb4ccd
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
