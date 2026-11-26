-- Threat: !InfrastructureShared
-- Name: 125788c9b36ed
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
