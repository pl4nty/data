-- Threat: !InfrastructureShared
-- Name: dc78b6bed72f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
