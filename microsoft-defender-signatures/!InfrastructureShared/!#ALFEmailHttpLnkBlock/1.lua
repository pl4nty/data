-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFEmailHttpLnkBlock\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetNormalizedScript)(true)
local l_0_1 = {}
l_0_1.png = true
l_0_1.gif = true
l_0_1.jpg = true
l_0_1.jpeg = true
l_0_1.bmp = true
l_0_1.svg = true
l_0_1.ico = true
l_0_1.webp = true
l_0_1.woff = true
l_0_1.woff2 = true
l_0_1.ttf = true
l_0_1.eot = true
l_0_1.otf = true
l_0_1.css = true
l_0_1.json = true
l_0_1.txt = true
local l_0_2 = {}
for l_0_6 in (string.gmatch)(l_0_0, "[Hh][Tt][Tt][Pp][Ss]?://[%w-_%./%%=]+") do
  l_0_6 = (string.gsub)(l_0_6, "[/]+$", "")
  local l_0_7 = l_0_6:match("%.(%w+)$")
  if l_0_7 ~= nil then
    l_0_7 = l_0_7:lower()
  end
  if #l_0_6 > 10 and not l_0_1[l_0_7] then
    (table.insert)(l_0_2, l_0_6)
  end
end
do
  if l_0_2 == nil or #l_0_2 == 0 then
    return mp.CLEAN
  end
  l_0_2 = table_dedup(l_0_2)
  local l_0_8 = {}
  local l_0_9 = {}
  for l_0_13,l_0_14 in ipairs(l_0_2) do
    local l_0_15, l_0_16 = (mp.CheckUrl)(l_0_14, 2)
    if l_0_16 == 1 then
      (table.insert)(l_0_8, l_0_14)
      local l_0_17 = l_0_14:match("^[^/]+//([^/]+)")
      if l_0_17 and l_0_9[l_0_17] then
        l_0_9[l_0_17] = l_0_9[l_0_17] + 1
      else
        l_0_9[l_0_17] = 1
      end
    end
  end
  do
    if l_0_8 == nil or #l_0_8 == 0 then
      return mp.CLEAN
    end
    local l_0_18 = {}
    for l_0_22 = 1, math_min(10, #l_0_8) do
      local l_0_23 = #l_0_18 + 1
      l_0_18[l_0_23] = l_0_8[l_0_22]
    end
    set_research_data("SuspUrls", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_18)), false)
    set_research_data("SuspDomains", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_9)), false)
    return mp.INFECTED
  end
end

