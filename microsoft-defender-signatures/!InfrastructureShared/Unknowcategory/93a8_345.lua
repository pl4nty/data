-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93a8_345.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("SIGATTR:FindAvastAV") and (mp.get_mpattribute)("SIGATTR:ExCheckInstalledAV") and (mp.get_mpattribute)("SIGATTR:DirectoryWalkerVfs") and (mp.get_mpattribute)("SIGATTR:FindBaiuduAV") then
  return mp.INFECTED
end
return mp.CLEAN

