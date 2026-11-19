-- Threat: !InfrastructureShared
-- Name: ba7847d8d844
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
