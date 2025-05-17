-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3bd_242.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and #(this_sigattrlog[2]).utf8p2 >= 300 then
  return mp.INFECTED
end
return mp.CLEAN

