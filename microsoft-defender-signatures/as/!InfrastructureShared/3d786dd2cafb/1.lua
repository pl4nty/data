-- Threat: !InfrastructureShared
-- Name: 3d786dd2cafb
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
