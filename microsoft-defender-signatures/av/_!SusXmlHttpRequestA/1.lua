-- Threat: \xac!SusXmlHttpRequest.A
-- Type: 13
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: (AGGR:Exploit/SusXmlRequest)

local l_0_0 = tostring(headerpage)
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = l_0_0 .. l_0_1
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)

local function l_0_3(l_1_0)
  local l_1_1 = {}
  for l_1_2 in string.gmatch(l_1_0, "http[s]?://[^\"%s]+") do
    table.insert(l_1_1, l_1_2)
  end
  return l_1_1
end

local l_0_4 = l_0_3(l_0_2)
l_0_4 = table_dedup(l_0_4)
local l_0_5 = {}
l_0_5.SIG_CONTEXT = "AMSI"
l_0_5.CONTENT_SOURCE = "LUAGENERIC_DEVIL_AMSI"
l_0_5.PROCESS_CONTEXT = "wscript_or_cscript"
l_0_5.FILELESS = "true"
l_0_5.CMDLINE_URL = "true"
for l_0_6, l_0_7 in ipairs(l_0_4) do
  if string.match(l_0_7, "^https?://") then
    local l_0_8, l_0_9 = mp.CheckUrl(l_0_7)
    if l_0_8 == 1 and l_0_9 == 1 then
      return mp.CLEAN
    end
    local l_0_10 = SafeGetUrlReputation({l_0_7}, l_0_5, false, 3000)
    if l_0_10.urls[l_0_7] and (l_0_10.urls[l_0_7].determination == 2 or l_0_10.urls[l_0_7].determination == 3) and l_0_10.urls[l_0_7].confidence >= 60 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
