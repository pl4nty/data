-- Threat: !InfrastructureShared
-- Name: ab789a9e7ce7
-- Type: 21

if pe.get_versioninfo().OriginalFilename == "svhost.exe" then
  return mp.INFECTED
end
return mp.LOWFI
