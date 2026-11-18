-- Threat: !InfrastructureShared
-- Name: 4878e907c270
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
