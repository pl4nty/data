-- Threat: !InfrastructureShared
-- Name: 5a7834a3aaa0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
