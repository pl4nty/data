-- Threat: !InfrastructureShared
-- Name: ca789ac52b51
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
