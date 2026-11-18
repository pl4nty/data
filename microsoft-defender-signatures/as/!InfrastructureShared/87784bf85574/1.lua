-- Threat: !InfrastructureShared
-- Name: 87784bf85574
-- Type: 21

mp.set_mpattribute("HSTR:Trojan:MSIL/Grotseento")
if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
