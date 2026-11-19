-- Threat: !InfrastructureShared
-- Name: e540ebbe09a3
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
