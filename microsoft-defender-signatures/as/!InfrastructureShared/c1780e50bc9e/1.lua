-- Threat: !InfrastructureShared
-- Name: c1780e50bc9e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
