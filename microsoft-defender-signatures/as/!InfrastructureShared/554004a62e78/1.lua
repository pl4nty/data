-- Threat: !InfrastructureShared
-- Name: 554004a62e78
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
