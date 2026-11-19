-- Threat: !InfrastructureShared
-- Name: 2678c4f3aefe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
