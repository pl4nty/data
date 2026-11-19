-- Threat: !InfrastructureShared
-- Name: 5778d04a7c40
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
