-- Threat: !InfrastructureShared
-- Name: 4a78583795de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
