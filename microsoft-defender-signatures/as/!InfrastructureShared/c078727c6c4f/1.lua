-- Threat: !InfrastructureShared
-- Name: c078727c6c4f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
