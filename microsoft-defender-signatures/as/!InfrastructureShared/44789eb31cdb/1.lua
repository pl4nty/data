-- Threat: !InfrastructureShared
-- Name: 44789eb31cdb
-- Type: 21

if pe.get_versioninfo().OriginalFilename == "winscp.exe" then
  return mp.INFECTED
end
return mp.CLEAN
