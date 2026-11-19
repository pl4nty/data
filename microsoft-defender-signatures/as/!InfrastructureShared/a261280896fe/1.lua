-- Threat: !InfrastructureShared
-- Name: a261280896fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
