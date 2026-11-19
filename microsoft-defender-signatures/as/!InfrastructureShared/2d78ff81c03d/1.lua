-- Threat: !InfrastructureShared
-- Name: 2d78ff81c03d
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
