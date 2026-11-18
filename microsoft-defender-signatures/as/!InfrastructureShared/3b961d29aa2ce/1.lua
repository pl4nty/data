-- Threat: !InfrastructureShared
-- Name: 3b961d29aa2ce
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
