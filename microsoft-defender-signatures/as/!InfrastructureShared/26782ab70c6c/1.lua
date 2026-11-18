-- Threat: !InfrastructureShared
-- Name: 26782ab70c6c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
