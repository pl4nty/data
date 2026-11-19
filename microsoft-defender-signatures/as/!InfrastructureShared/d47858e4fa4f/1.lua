-- Threat: !InfrastructureShared
-- Name: d47858e4fa4f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
