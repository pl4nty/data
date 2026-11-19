-- Threat: !InfrastructureShared
-- Name: 4f7806825741
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
