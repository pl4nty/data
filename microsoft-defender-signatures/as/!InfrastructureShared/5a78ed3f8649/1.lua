-- Threat: !InfrastructureShared
-- Name: 5a78ed3f8649
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
