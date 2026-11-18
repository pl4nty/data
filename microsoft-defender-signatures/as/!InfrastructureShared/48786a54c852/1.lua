-- Threat: !InfrastructureShared
-- Name: 48786a54c852
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
