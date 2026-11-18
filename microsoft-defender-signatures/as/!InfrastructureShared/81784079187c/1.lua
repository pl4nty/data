-- Threat: !InfrastructureShared
-- Name: 81784079187c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
