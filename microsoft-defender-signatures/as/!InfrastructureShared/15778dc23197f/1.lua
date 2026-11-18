-- Threat: !InfrastructureShared
-- Name: 15778dc23197f
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
