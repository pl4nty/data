-- Threat: !InfrastructureShared
-- Name: 10540a6480a2a
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
