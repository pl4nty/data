-- Threat: !InfrastructureShared
-- Name: 1a54052eaa35d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
