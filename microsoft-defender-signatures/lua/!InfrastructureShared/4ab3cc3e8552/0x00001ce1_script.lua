-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3cc3e8552\0x00001ce1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  (bm.trigger_sig)("DroppedElf", (this_sigattrlog[1]).utf8p1)
end
return mp.CLEAN

