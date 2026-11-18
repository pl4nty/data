-- Threat: !InfrastructureShared
-- Name: 13b78aadbb912
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0.InternalName == "RunPE.dll" then
    return mp.INFECTED
  end
end
return mp.CLEAN
