-- Threat: !InfrastructureShared
-- Name: 42e787c1ee524
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
