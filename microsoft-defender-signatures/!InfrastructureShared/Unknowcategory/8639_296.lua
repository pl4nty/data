-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8639_296.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
    local l_0_0 = (this_sigattrlog[7]).utf8p2
    ;
    (bm.add_related_string)("vname", l_0_0, bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end

