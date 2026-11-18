-- Threat: !InfrastructureShared
-- Name: 3d788e0a993d
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
