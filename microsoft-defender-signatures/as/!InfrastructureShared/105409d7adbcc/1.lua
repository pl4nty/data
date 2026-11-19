-- Threat: !InfrastructureShared
-- Name: 105409d7adbcc
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
