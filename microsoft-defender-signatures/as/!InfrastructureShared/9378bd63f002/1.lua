-- Threat: !InfrastructureShared
-- Name: 9378bd63f002
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
