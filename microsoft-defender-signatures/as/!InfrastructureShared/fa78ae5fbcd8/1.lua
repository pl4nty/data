-- Threat: !InfrastructureShared
-- Name: fa78ae5fbcd8
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
