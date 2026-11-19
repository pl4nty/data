-- Threat: !InfrastructureShared
-- Name: 8278aa752d33
-- Type: 21

if mp.get_mpattribute("SIGATTR:FindAvastAV") and mp.get_mpattribute("SIGATTR:ExCheckInstalledAV") and mp.get_mpattribute("SIGATTR:DirectoryWalkerVfs") and mp.get_mpattribute("SIGATTR:FindBaiuduAV") then
  return mp.INFECTED
end
return mp.CLEAN
