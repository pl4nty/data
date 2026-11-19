-- Threat: !InfrastructureShared
-- Name: 14540ed40f40f
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
