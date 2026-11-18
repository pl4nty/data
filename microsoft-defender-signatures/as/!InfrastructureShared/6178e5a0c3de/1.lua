-- Threat: !InfrastructureShared
-- Name: 6178e5a0c3de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
