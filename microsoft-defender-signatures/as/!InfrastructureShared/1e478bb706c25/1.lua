-- Threat: !InfrastructureShared
-- Name: 1e478bb706c25
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
