-- Threat: !InfrastructureShared
-- Name: 997833f2487e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
