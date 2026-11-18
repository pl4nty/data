-- Threat: !InfrastructureShared
-- Name: 2778a9facb51
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
