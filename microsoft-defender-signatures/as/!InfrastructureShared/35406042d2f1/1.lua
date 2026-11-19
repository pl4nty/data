-- Threat: !InfrastructureShared
-- Name: 35406042d2f1
-- Type: 21

if string.lower(string.sub(pe.get_versioninfo().OriginalFilename, 1, 5)) == "lsass" then
  return mp.INFECTED
end
return mp.CLEAN
