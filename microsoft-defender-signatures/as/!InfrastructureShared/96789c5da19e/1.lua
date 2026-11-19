-- Threat: !InfrastructureShared
-- Name: 96789c5da19e
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
