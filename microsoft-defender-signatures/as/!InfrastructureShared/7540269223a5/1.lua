-- Threat: !InfrastructureShared
-- Name: 7540269223a5
-- Type: 21

if mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("AGGR:MSIL:GenCommercialObfuscator.A") then
  local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
  if l_0_0 == 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
