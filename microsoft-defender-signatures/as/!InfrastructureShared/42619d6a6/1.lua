-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\42619d6a6\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 20 then
  return mp.INFECTED
end
if (mp.getfilesize)() < 7340032 and peattributes.isdll and peattributes.x86_image and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
end
return mp.CLEAN

