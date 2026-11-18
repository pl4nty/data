-- Threat: !InfrastructureShared
-- Name: 4d78d5803b87
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
