-- Threat: !InfrastructureShared
-- Name: e178ec2506a4
-- Type: 21

if pe.get_versioninfo().OriginalFilename == "rclone.exe" then
  return mp.INFECTED
end
return mp.CLEAN
