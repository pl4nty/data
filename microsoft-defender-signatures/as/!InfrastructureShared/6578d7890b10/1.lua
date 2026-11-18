-- Threat: !InfrastructureShared
-- Name: 6578d7890b10
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
