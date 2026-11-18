-- Threat: !InfrastructureShared
-- Name: 9a78618e6e67
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
