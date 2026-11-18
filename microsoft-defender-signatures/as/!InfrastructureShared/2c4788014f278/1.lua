-- Threat: !InfrastructureShared
-- Name: 2c4788014f278
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
