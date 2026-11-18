-- Threat: !InfrastructureShared
-- Name: 174785e634b61
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
