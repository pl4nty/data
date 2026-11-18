-- Threat: !InfrastructureShared
-- Name: 3378d036e726
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
