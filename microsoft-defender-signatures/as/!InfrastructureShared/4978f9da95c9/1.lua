-- Threat: !InfrastructureShared
-- Name: 4978f9da95c9
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
