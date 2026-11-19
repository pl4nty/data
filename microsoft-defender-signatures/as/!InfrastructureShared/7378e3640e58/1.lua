-- Threat: !InfrastructureShared
-- Name: 7378e3640e58
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
