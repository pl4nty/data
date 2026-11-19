-- Threat: !InfrastructureShared
-- Name: 17b7898291c2b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
