-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a27_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[7]).matched and (string.find)((this_sigattrlog[7]).utf8p1, (this_sigattrlog[5]).utf8p1, 1, true) then
  return mp.INFECTED
end
if (this_sigattrlog[6]).matched and (this_sigattrlog[8]).matched and (string.find)((this_sigattrlog[8]).utf8p1, (this_sigattrlog[6]).utf8p1, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

