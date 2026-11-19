-- Threat: !InfrastructureShared
-- Name: 6a7820454e05
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
