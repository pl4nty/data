-- Threat: !InfrastructureShared
-- Name: 54781b7b18fb
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
