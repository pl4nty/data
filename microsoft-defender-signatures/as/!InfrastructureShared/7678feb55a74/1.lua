-- Threat: !InfrastructureShared
-- Name: 7678feb55a74
-- Type: 21

if peattributes.ismsil == true or peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
