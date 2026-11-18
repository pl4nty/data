-- Threat: !InfrastructureShared
-- Name: 1f7878d0dcb6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
