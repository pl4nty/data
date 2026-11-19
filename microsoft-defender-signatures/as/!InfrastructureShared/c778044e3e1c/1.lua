-- Threat: !InfrastructureShared
-- Name: c778044e3e1c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
