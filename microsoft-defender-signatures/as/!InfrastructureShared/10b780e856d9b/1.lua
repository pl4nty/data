-- Threat: !InfrastructureShared
-- Name: 10b780e856d9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
