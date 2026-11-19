-- Threat: !InfrastructureShared
-- Name: 587865e86340
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
