-- Threat: !InfrastructureShared
-- Name: 6f7856be6b0d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
