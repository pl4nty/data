-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5ef2_210.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 5242880 and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN

