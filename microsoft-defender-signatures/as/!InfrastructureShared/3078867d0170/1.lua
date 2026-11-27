-- Threat: !InfrastructureShared
-- Name: 3078867d0170
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("Packed:Confuser") then
  return mp.INFECTED
end
return mp.CLEAN
