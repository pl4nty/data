-- Threat: !InfrastructureShared
-- Name: 7478afb1cb94
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
