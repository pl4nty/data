-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5a49_luac 

-- params : ...
-- function num : 0
if ((pe.get_versioninfo)()).OriginalFilename == "rclone.exe" then
  return mp.INFECTED
end
return mp.CLEAN

