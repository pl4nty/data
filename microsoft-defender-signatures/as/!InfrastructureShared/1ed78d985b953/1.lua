-- Threat: !InfrastructureShared
-- Name: 1ed78d985b953
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
