-- Threat: !InfrastructureShared
-- Name: 3a78507d78cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
