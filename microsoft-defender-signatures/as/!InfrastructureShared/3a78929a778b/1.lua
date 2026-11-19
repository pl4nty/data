-- Threat: !InfrastructureShared
-- Name: 3a78929a778b
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
