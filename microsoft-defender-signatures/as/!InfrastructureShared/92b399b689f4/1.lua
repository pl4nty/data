-- Threat: !InfrastructureShared
-- Name: 92b399b689f4
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1 = pcall(MpCommon.PathToWin32Path, this_sigattrlog[1].utf8p1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3[l_0_1] = 1
local l_0_4 = {}
table.insert(l_0_4, {NotePath = l_0_1, NoteName = l_0_2})
local l_0_5 = ""
local l_0_6 = ""
local l_0_7 = 0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0, l_0_5 = pcall(MpCommon.PathToWin32Path, this_sigattrlog[3].utf8p1)
  l_0_5 = string.lower(l_0_5)
  if l_0_5 ~= nil and l_0_5 ~= "" then
    l_0_6 = string.match(l_0_5, "\\([^\\]+)$")
    if l_0_6 ~= nil and l_0_6 ~= "" and l_0_3[l_0_5] ~= 1 and l_0_2 == l_0_6 then
      l_0_7 = l_0_7 + 1
      l_0_3[l_0_5] = 1
      table.insert(l_0_4, {NotePath = l_0_5, NoteName = l_0_6})
    end
  end
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0, l_0_5 = pcall(MpCommon.PathToWin32Path, this_sigattrlog[4].utf8p1)
  l_0_5 = string.lower(l_0_5)
  if l_0_5 ~= nil and l_0_5 ~= "" then
    l_0_6 = string.match(l_0_5, "\\([^\\]+)$")
    if l_0_6 ~= nil and l_0_6 ~= "" and l_0_3[l_0_5] ~= 1 and l_0_2 == l_0_6 then
      l_0_7 = l_0_7 + 1
      l_0_3[l_0_5] = 1
      table.insert(l_0_4, {NotePath = l_0_5, NoteName = l_0_6})
    end
  end
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0, l_0_5 = pcall(MpCommon.PathToWin32Path, this_sigattrlog[5].utf8p1)
  l_0_5 = string.lower(l_0_5)
  if l_0_5 ~= nil and l_0_5 ~= "" then
    l_0_6 = string.match(l_0_5, "\\([^\\]+)$")
    if l_0_6 ~= nil and l_0_6 ~= "" and l_0_3[l_0_5] ~= 1 and l_0_2 == l_0_6 then
      l_0_7 = l_0_7 + 1
      l_0_3[l_0_5] = 1
      table.insert(l_0_4, {NotePath = l_0_5, NoteName = l_0_6})
    end
  end
end
if l_0_7 == 3 then
  bm.add_related_string("RansomHaltZ", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
  extractRansomNote(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
