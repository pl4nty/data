-- Threat: !InfrastructureShared
-- Name: !#ALF:EmailHttpLnkBlock
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: InEmail & SCPT:LNK/http & (Html_file | Lua:HTMLExt | SCPT:HTMLFile)

local l_0_0 = mp.GetNormalizedScript(true)
local l_0_1 = {
  png = true,
  gif = true,
  jpg = true,
  jpeg = true,
  bmp = true,
  svg = true,
  ico = true,
  webp = true,
  woff = true,
  woff2 = true,
  ttf = true,
  eot = true,
  otf = true,
  css = true,
  json = true,
  txt = true
}
local l_0_2 = {}
for l_0_3 in string.gmatch(l_0_0, "[Hh][Tt][Tt][Pp][Ss]?://[%w-_%./%%=]+") do
  l_0_3 = string.gsub(l_0_3, "[/]+$", "")
  local l_0_4 = l_0_3:match("%.(%w+)$")
  if l_0_4 ~= nil then
    l_0_4 = l_0_4:lower()
  end
  if 10 < #l_0_3 and not l_0_1[l_0_4] then
    table.insert(l_0_2, l_0_3)
  end
end
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
l_0_2 = table_dedup(l_0_2)
local l_0_5 = {}
local l_0_6 = {}
for l_0_7, l_0_8 in ipairs(l_0_2) do
  local l_0_9, l_0_10 = mp.CheckUrl(l_0_8, 2)
  if l_0_10 == 1 then
    table.insert(l_0_5, l_0_8)
    local l_0_11 = l_0_8:match("^[^/]+//([^/]+)")
    if l_0_11 then
      if l_0_6[l_0_11] then
        l_0_6[l_0_11] = l_0_6[l_0_11] + 1
      else
        l_0_6[l_0_11] = 1
      end
    end
  end
end
if l_0_5 == nil or #l_0_5 == 0 then
  return mp.CLEAN
end
local l_0_12 = {}
for l_0_13 = 1, math_min(10, #l_0_5) do
  l_0_12[#l_0_12 + 1] = l_0_5[l_0_13]
end
set_research_data("SuspUrls", MpCommon.Base64Encode(safeJsonSerialize(l_0_12)), false)
set_research_data("SuspDomains", MpCommon.Base64Encode(safeJsonSerialize(l_0_6)), false)
return mp.INFECTED
