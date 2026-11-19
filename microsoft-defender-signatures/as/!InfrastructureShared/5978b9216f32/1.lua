-- Threat: !InfrastructureShared
-- Name: 5978b9216f32
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
