-- Threat: !InfrastructureShared
-- Name: 8578fb47db03
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
