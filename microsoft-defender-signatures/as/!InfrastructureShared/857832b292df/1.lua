-- Threat: !InfrastructureShared
-- Name: 857832b292df
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
