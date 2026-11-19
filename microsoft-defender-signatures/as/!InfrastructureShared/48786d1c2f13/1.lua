-- Threat: !InfrastructureShared
-- Name: 48786d1c2f13
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
