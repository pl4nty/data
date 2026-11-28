-- Threat: !InfrastructureShared
-- Name: 3e78b0927405
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
