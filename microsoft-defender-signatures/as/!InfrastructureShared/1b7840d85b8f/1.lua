-- Threat: !InfrastructureShared
-- Name: 1b7840d85b8f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
