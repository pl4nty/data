-- Threat: !InfrastructureShared
-- Name: 3d781d67a78f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
