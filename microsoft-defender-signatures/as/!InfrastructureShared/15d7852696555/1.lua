-- Threat: !InfrastructureShared
-- Name: 15d7852696555
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
