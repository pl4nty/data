-- Threat: !InfrastructureShared
-- Name: a978a782657d
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
