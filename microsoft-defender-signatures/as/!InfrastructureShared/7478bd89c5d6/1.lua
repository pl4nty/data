-- Threat: !InfrastructureShared
-- Name: 7478bd89c5d6
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(VFS:install.exe)") then
  return mp.INFECTED
end
return mp.CLEAN
