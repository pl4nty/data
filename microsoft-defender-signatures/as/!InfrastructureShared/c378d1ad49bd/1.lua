-- Threat: !InfrastructureShared
-- Name: c378d1ad49bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
