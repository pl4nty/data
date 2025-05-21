-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6d6b_238.luac 

-- params : ...
-- function num : 0
if (string.match)((this_sigattrlog[1]).utf8p1, "\\%l%l%l%l%l%.exe$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

