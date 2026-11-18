-- Threat: !InfrastructureShared
-- Name: c9780c07d710
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
