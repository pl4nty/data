-- Threat: !InfrastructureShared
-- Name: 8241076766d6
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
