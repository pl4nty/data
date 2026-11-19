-- Threat: !InfrastructureShared
-- Name: 12540b6266bdf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
