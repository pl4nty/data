-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000e87_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and #(this_sigattrlog[1]).utf8p2 >= 300 then
  return mp.INFECTED
end
return mp.CLEAN

