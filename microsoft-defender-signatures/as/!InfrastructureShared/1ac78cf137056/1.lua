-- Threat: !InfrastructureShared
-- Name: 1ac78cf137056
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
