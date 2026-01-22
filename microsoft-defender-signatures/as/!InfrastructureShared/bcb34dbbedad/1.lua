-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bcb34dbbedad\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
    local l_0_0 = (this_sigattrlog[6]).utf8p2
    ;
    (bm.add_related_string)("ReadVM", l_0_0, bm.RelatedStringBMReport)
    add_parents()
    return mp.INFECTED
  end
  return mp.CLEAN
end

