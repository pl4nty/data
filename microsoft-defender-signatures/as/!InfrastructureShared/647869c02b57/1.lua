-- Threat: !InfrastructureShared
-- Name: 647869c02b57
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
