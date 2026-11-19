-- Threat: !InfrastructureShared
-- Name: 13978f580d0c1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
