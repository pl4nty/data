-- Threat: !InfrastructureShared
-- Name: c4781dcd9d65
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
