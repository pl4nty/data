-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a40_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched and (this_sigattrlog[3]).matched and (this_sigattrlog[4]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= nil then
  if (string.find)((this_sigattrlog[1]).utf8p1, "/private/tmp/", 1, true) ~= 1 and (string.find)((this_sigattrlog[1]).utf8p1, "/tmp/", 1, true) ~= 1 then
    return mp.CLEAN
  end
  if (this_sigattrlog[1]).utf8p1 == (this_sigattrlog[4]).utf8p1 then
    local l_0_0 = (mp.GetExecutablesFromCommandLine)((this_sigattrlog[3]).utf8p2)
    if l_0_0 ~= nil then
      for l_0_4,l_0_5 in ipairs(l_0_0) do
        if (string.find)(l_0_5, "/", 1, true) == 1 and (string.find)((this_sigattrlog[1]).utf8p1, l_0_5, 1, true) and ((string.find)((this_sigattrlog[2]).utf8p2, l_0_5, 1, true) or (string.find)((this_sigattrlog[2]).utf8p2, (this_sigattrlog[1]).utf8p1, 1, true)) then
          return mp.INFECTED
        end
      end
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end

