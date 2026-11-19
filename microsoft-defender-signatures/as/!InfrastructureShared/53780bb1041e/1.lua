-- Threat: !InfrastructureShared
-- Name: 53780bb1041e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
