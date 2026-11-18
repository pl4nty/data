-- Threat: !InfrastructureShared
-- Name: f9785f5a8aae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
