-- Threat: !InfrastructureShared
-- Name: c5404e3e8011
-- Type: 21

if peattributes.isexe == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
