-- Threat: !InfrastructureShared
-- Name: 46787d5641ca
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
