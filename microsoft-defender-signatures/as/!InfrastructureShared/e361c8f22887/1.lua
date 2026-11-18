-- Threat: !InfrastructureShared
-- Name: e361c8f22887
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
