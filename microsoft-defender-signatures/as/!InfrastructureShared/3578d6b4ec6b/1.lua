-- Threat: !InfrastructureShared
-- Name: 3578d6b4ec6b
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
