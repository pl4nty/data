-- Threat: !InfrastructureShared
-- Name: 3d78063b2d08
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
