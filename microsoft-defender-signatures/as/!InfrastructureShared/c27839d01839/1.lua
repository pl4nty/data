-- Threat: !InfrastructureShared
-- Name: c27839d01839
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
