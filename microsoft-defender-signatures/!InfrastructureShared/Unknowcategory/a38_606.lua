-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a38_606.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched and (this_sigattrlog[3]).matched and (this_sigattrlog[4]).matched and (this_sigattrlog[5]).matched and (this_sigattrlog[6]).matched then
  local l_0_0 = (this_sigattrlog[1]).utf8p1
  local l_0_1 = (this_sigattrlog[4]).utf8p1
  if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" and (string.find)((this_sigattrlog[2]).utf8p2, l_0_0, 1, true) and (string.find)((this_sigattrlog[3]).utf8p2, l_0_0, 1, true) and (string.find)((this_sigattrlog[5]).utf8p2, l_0_1, 1, true) and (string.find)((this_sigattrlog[6]).utf8p2, l_0_1, 1, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

