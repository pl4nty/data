-- Threat: !InfrastructureShared
-- Name: 7540a7c5e837
-- Type: 21

if pe.get_versioninfo().OriginalFilename:lower() ~= "veeamp.exe" then
  return mp.CLEAN
end
return mp.INFECTED
