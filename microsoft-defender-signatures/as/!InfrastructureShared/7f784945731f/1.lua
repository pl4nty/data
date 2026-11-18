-- Threat: !InfrastructureShared
-- Name: 7f784945731f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
