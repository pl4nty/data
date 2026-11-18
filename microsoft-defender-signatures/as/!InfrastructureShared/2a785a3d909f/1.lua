-- Threat: !InfrastructureShared
-- Name: 2a785a3d909f
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
