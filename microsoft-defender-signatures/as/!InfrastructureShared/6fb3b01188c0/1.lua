-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6fb3b01188c0\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched or not (this_sigattrlog[3]).utf8p1 or not (this_sigattrlog[3]).utf8p2 then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p2)
if #l_0_0 >= 500 then
  (bm.add_related_string)("[->] MEDICATED LONG PAYLOAD: ", l_0_0, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("[->] MEDICATED BYTES: ", (this_sigattrlog[3]).utf8p2, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN

