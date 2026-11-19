-- Threat: !InfrastructureShared
-- Name: 387899023b91
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
