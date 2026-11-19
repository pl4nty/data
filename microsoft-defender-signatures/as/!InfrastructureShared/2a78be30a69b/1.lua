-- Threat: !InfrastructureShared
-- Name: 2a78be30a69b
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
