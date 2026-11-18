-- Threat: !InfrastructureShared
-- Name: 7c786af7717f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
