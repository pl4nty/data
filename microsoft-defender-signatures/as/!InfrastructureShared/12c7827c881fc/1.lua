-- Threat: !InfrastructureShared
-- Name: 12c7827c881fc
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
