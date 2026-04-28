-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5278da463\1.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and (mp.getfilesize)() < 1048576 and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
  return mp.INFECTED
end
return mp.CLEAN

