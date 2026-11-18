-- Threat: !InfrastructureShared
-- Name: 75403297ec11
-- Type: 21

if pe.get_versioninfo().OriginalFilename:lower() ~= "sharpshares.exe" then
  return mp.CLEAN
end
return mp.INFECTED
