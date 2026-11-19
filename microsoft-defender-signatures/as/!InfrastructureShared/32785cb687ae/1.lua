-- Threat: !InfrastructureShared
-- Name: 32785cb687ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
