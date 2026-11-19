-- Threat: !InfrastructureShared
-- Name: 1857830ae09ec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
