-- Threat: !InfrastructureShared
-- Name: bb784d4c04a2
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
