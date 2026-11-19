-- Threat: !InfrastructureShared
-- Name: c478f3931fcc
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
