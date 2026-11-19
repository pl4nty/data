-- Threat: !InfrastructureShared
-- Name: 37789c20cf2f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
