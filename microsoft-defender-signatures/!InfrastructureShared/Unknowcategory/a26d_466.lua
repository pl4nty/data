-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a26d_466.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetBruteMatchData)()
local l_0_1 = l_0_0.match_offset
local l_0_2 = 128
local l_0_3 = ""
if l_0_0.is_header then
  l_0_3 = (tostring(headerpage)):sub(l_0_1, l_0_1 + l_0_2)
else
  l_0_3 = (tostring(footerpage)):sub(l_0_1, l_0_1 + l_0_2)
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (string.gsub)(l_0_3, "[%d+%-*%/()]+", "")
if l_0_4 ~= nil and #l_0_3 - #l_0_4 > 40 then
  return mp.INFECTED
end
return mp.CLEAN

