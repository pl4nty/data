-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b9b3a2b9b023\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p1 ~= "" then
  (bm.trigger_sig)("ArchiveDroppedOnMac", (this_sigattrlog[1]).utf8p1)
end
return mp.CLEAN

