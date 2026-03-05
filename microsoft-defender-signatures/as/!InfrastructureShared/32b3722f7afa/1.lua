-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3722f7afa\1.luac 

-- params : ...
-- function num : 0
if isnull(this_sigattrlog[1]) or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
;
(bm.add_related_string)("MaliciousSerializedObjectInfo", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
return mp.INFECTED

