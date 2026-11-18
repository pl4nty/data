-- Threat: !InfrastructureShared
-- Name: 32784596600e
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
