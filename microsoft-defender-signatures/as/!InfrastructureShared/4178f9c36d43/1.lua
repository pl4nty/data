-- Threat: !InfrastructureShared
-- Name: 4178f9c36d43
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
