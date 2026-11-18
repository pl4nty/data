-- Threat: !InfrastructureShared
-- Name: d9789f754c2f
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("SIGA:MSIL/Suspicious.CreateRunKey.B") then
  return mp.INFECTED
end
return mp.CLEAN
