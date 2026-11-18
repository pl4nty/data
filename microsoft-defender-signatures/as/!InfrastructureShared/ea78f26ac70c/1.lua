-- Threat: !InfrastructureShared
-- Name: ea78f26ac70c
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
