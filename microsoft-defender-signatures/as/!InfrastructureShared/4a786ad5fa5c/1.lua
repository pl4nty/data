-- Threat: !InfrastructureShared
-- Name: 4a786ad5fa5c
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0.InternalName == "VideoProjectsLauncher" or l_0_0.CompanyName == "Microsoft Corporation" or l_0_0.OriginalFilename == "VideoProjectsLauncher.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
