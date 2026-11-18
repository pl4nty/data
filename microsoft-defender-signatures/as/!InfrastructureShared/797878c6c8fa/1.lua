-- Threat: !InfrastructureShared
-- Name: 797878c6c8fa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
