-- Threat: !InfrastructureShared
-- Name: d378c5382d1c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
