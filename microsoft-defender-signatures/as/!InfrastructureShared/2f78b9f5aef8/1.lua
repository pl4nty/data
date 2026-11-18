-- Threat: !InfrastructureShared
-- Name: 2f78b9f5aef8
-- Type: 21

if peattributes.ismsil == true or peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
