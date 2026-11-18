-- Threat: !InfrastructureShared
-- Name: cf7839ededc9
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.LOWFI
