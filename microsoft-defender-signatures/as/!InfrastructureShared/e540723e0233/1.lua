-- Threat: !InfrastructureShared
-- Name: e540723e0233
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
