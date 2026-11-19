-- Threat: !InfrastructureShared
-- Name: 49788a7bf1d3
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
