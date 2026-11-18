-- Threat: !InfrastructureShared
-- Name: 92784c48cc2b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
