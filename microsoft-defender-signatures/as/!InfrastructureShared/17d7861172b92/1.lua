-- Threat: !InfrastructureShared
-- Name: 17d7861172b92
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
