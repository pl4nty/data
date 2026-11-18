-- Threat: !InfrastructureShared
-- Name: 3037894a76b9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
