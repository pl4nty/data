-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3081511b2\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  (bm.add_related_string)("Evidence", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
end
return mp.INFECTED

