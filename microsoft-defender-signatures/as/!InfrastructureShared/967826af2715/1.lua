-- Threat: !InfrastructureShared
-- Name: 967826af2715
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
