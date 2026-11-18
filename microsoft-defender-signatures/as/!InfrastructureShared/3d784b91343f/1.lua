-- Threat: !InfrastructureShared
-- Name: 3d784b91343f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
