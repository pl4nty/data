-- Threat: !InfrastructureShared
-- Name: 9a78444d3cf3
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
