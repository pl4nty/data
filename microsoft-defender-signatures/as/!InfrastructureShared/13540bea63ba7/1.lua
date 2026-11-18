-- Threat: !InfrastructureShared
-- Name: 13540bea63ba7
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
