-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\22a_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
  local l_0_1 = l_0_0:match("totalsizeappend:(%d+);")
  if l_0_1 then
    l_0_1 = tonumber(l_0_1)
  end
  local l_0_2 = l_0_0:match("totalsizewrite:(%d+);")
  if l_0_2 then
    l_0_2 = tonumber(l_0_2)
  end
  if l_0_2 > 0 and l_0_1 > 0 then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

