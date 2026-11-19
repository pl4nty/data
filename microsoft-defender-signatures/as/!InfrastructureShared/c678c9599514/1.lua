-- Threat: !InfrastructureShared
-- Name: c678c9599514
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
