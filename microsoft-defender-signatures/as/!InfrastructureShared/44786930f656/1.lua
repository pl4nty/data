-- Threat: !InfrastructureShared
-- Name: 44786930f656
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
