-- Threat: !InfrastructureShared
-- Name: 2a785e39f9e6
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
