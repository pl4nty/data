-- Threat: !InfrastructureShared
-- Name: 2c781bd37626
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
