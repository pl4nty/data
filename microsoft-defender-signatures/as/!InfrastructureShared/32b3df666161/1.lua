-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3df666161\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  (bm.add_related_string)("AdditionalInfo", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
end
add_parents()
return mp.INFECTED

