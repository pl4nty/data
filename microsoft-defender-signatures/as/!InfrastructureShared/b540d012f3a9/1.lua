-- Threat: !InfrastructureShared
-- Name: b540d012f3a9
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
