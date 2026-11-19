-- Threat: !InfrastructureShared
-- Name: 1254075ce9d8e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
