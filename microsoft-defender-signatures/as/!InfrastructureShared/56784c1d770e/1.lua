-- Threat: !InfrastructureShared
-- Name: 56784c1d770e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
