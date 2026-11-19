-- Threat: !InfrastructureShared
-- Name: 119784e7aa2cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
