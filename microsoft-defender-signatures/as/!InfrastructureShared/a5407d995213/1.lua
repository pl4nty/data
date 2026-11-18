-- Threat: !InfrastructureShared
-- Name: a5407d995213
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
