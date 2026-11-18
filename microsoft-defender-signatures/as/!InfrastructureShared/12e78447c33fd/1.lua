-- Threat: !InfrastructureShared
-- Name: 12e78447c33fd
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
