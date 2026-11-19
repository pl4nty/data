-- Threat: !InfrastructureShared
-- Name: e54026a82982
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
