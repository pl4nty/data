-- Threat: !InfrastructureShared
-- Name: 3d783d14685f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
