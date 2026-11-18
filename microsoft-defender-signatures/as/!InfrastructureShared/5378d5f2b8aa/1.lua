-- Threat: !InfrastructureShared
-- Name: 5378d5f2b8aa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
