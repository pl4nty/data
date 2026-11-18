-- Threat: !InfrastructureShared
-- Name: 3e78dda10bcd
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
