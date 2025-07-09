-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19cb36ffc6afe\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
local l_0_2 = ""
if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[7]).utf8p1)
  if l_0_0 ~= "" and (mp.IsKnownFriendlyFile)(l_0_0, true, false) == false then
    (bm.add_threat_file)(l_0_0)
    return mp.INFECTED
  end
end
if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[8]).utf8p1)
  if l_0_1 ~= "" and (mp.IsKnownFriendlyFile)(l_0_1, true, false) == false then
    (bm.add_threat_file)(l_0_1)
    return mp.INFECTED
  end
end
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[9]).utf8p1)
  if l_0_2 ~= "" and (mp.IsKnownFriendlyFile)(l_0_2, true, false) == false then
    (bm.add_threat_file)(l_0_2)
    return mp.INFECTED
  end
end
return mp.CLEAN

