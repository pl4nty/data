-- Threat: !InfrastructureShared
-- Name: 13f78706fed2b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
