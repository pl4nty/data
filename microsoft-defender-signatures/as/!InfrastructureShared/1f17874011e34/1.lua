-- Threat: !InfrastructureShared
-- Name: 1f17874011e34
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
