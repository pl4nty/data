-- Threat: !InfrastructureShared
-- Name: 957815f7bcfb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
