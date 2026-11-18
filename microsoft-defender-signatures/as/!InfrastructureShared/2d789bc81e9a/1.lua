-- Threat: !InfrastructureShared
-- Name: 2d789bc81e9a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
