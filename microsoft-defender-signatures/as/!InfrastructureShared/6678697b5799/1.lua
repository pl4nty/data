-- Threat: !InfrastructureShared
-- Name: 6678697b5799
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
