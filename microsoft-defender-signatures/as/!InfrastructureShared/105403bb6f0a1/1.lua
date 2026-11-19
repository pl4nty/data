-- Threat: !InfrastructureShared
-- Name: 105403bb6f0a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
