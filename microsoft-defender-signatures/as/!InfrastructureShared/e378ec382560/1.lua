-- Threat: !InfrastructureShared
-- Name: e378ec382560
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
