-- Threat: !InfrastructureShared
-- Name: 11f783dcd52cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
