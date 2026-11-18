-- Threat: !InfrastructureShared
-- Name: 2a7867a3ee51
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
