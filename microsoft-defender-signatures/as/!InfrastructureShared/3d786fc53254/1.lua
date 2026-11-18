-- Threat: !InfrastructureShared
-- Name: 3d786fc53254
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
