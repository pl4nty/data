-- Threat: !InfrastructureShared
-- Name: e5404914c74d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
