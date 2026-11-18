-- Threat: !InfrastructureShared
-- Name: 8378aebb78f6
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
