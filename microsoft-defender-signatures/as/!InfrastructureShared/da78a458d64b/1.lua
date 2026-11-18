-- Threat: !InfrastructureShared
-- Name: da78a458d64b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
