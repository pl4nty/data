-- Threat: !InfrastructureShared
-- Name: 6a784c76cfad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
