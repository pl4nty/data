-- Threat: !InfrastructureShared
-- Name: 1d540085a8c8c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
