-- Threat: !InfrastructureShared
-- Name: 4a78f78faf57
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
