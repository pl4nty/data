-- Threat: !InfrastructureShared
-- Name: c478780c82fd
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
