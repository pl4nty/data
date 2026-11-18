-- Threat: !InfrastructureShared
-- Name: 2a78aa25acb0
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
