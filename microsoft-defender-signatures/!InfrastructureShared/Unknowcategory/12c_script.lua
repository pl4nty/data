-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\12c_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
  (bm.add_related_file)((this_sigattrlog[10]).utf8p2)
end
return mp.INFECTED

