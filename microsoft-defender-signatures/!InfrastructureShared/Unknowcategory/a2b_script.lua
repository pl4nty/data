-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2b_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[5]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= nil then
  local l_0_0 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[2]).utf8p2)
  if l_0_0 ~= nil then
    for l_0_4,l_0_5 in ipairs(l_0_0) do
      if (string.find)((this_sigattrlog[5]).utf8p2, l_0_5, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end

