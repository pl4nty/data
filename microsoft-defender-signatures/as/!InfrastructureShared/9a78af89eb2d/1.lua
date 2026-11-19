-- Threat: !InfrastructureShared
-- Name: 9a78af89eb2d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
