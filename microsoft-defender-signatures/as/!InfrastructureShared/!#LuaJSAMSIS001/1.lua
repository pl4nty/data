-- Threat: !InfrastructureShared
-- Name: !#Lua:JS.AMSI.S001
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsJScriptAMSIScan & (SCPT:JS/httprequestpost.ST1 | SCPT:JS/httprequestget.ST1)

local l_0_0 = tostring(footerpage)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.gsub(l_0_0, "%z", "")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = {
  ["www.w3.org"] = true,
  ["www.salesweb.jp"] = true,
  ["vkdj.org"] = true,
  ["utilities.pcpitstop.com"] = true,
  ["tile.thunderforest.com"] = true,
  ["switchboard.pcmatichome.com"] = true,
  ["switchboard.default.pcpitstop.com"] = true,
  ["schemas.xmlsoap.org"] = true,
  ["prod5.comcept.net"] = true,
  ["prod4.comcept.net"] = true,
  ["ny.cf.pcpitstop.com"] = true,
  ["login.microsoftonline.com"] = true,
  ["localhost.geoprostor.net"] = true,
  ["img.unitedconsumers.com"] = true,
  ["graph.microsoft.com"] = true,
  ["files.pcpitstop.com"] = true,
  ["az542455.vo.msecnd.net"] = true,
  ["api.weather.msn.com"] = true,
  ["api.slyp.com.au"] = true,
  ["10.125.31.183"] = true
}
local l_0_4
for l_0_5 in string.gmatch(l_0_1, "%.send.\"([A-Za-z0-9+/=]+)\"") do
  if l_0_5 ~= nil and l_0_5 ~= "" and string.len(l_0_5) >= 20 and string.len(l_0_5) <= 1000 then
    l_0_4 = MpCommon.Base64Decode(l_0_5)
    if l_0_4 ~= nil and l_0_4 ~= "" then
      mp.set_mpattribute("Lua:AMSI.JS.SendWithBase64Str.S1")
      break
    end
  end
end
for l_0_6 in string.gmatch(l_0_1, "//([A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+)/") do
  if l_0_6 ~= nil and l_0_6 ~= "" and string.len(l_0_6) >= 10 and string.len(l_0_6) <= 1000 then
    local l_0_7 = string.gsub(l_0_6, "%.", "_")
    mp.set_mpattribute("Lua:AMSI.JS.DomainWith4Parts.S1")
    mp.set_mpattribute("Lua:SuspDomain:" .. l_0_7)
    if not l_0_3[l_0_6] then
      table.insert(l_0_2, l_0_6)
    end
  end
end
for l_0_8 in string.gmatch(l_0_1, "//([A-Za-z0-9]+%.[A-Za-z0-9]+)/") do
  if l_0_8 ~= nil and l_0_8 ~= "" and string.len(l_0_8) >= 4 and string.len(l_0_8) <= 1000 then
    local l_0_9 = string.gsub(l_0_8, "%.", "_")
    mp.set_mpattribute("Lua:AMSI.JS.DomainWith2Parts.S1")
    mp.set_mpattribute("Lua:SuspDomain:" .. l_0_9)
    if not l_0_3[l_0_8] then
      table.insert(l_0_2, l_0_8)
    end
  end
end
for l_0_10 in string.gmatch(l_0_1, "//([A-Za-z0-9]+%.[A-Za-z0-9]+%.[A-Za-z0-9]+)/") do
  if l_0_10 ~= nil and l_0_10 ~= "" and string.len(l_0_10) >= 8 and string.len(l_0_10) <= 1000 and not l_0_3[l_0_10] then
    table.insert(l_0_2, l_0_10)
  end
end
l_0_2 = table_dedup(l_0_2)
local l_0_11 = {}
for l_0_12, l_0_13 in ipairs(l_0_2) do
  local l_0_14, l_0_15 = l_0_13:match("^([^:/?#]+)://(.+)$")
  if not l_0_14 then
    local l_0_16 = "http://"
    table.insert(l_0_11, l_0_16 .. l_0_13)
  else
    table.insert(l_0_11, l_0_13)
  end
end
l_0_2 = l_0_11
local l_0_17 = ""
local l_0_18 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_18 == mp.SCANREASON_AMSI then
  local l_0_19, l_0_20 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_19 and l_0_20 ~= nil then
    l_0_17 = string.lower(l_0_20)
  end
end
local l_0_21 = MpCommon.PathToWin32Path(l_0_17)
local l_0_22, l_0_23 = mp.GetMotwZoneForFile(l_0_21)
local l_0_24, l_0_25 = mp.GetMotwHostUrlForFile(l_0_21)
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_26 = {}
l_0_26.SIG_CONTEXT = "LUA_GENERIC"
l_0_26.CONTENT_SOURCE = "AMSI_JS"
l_0_26.PROCESS_CONTEXT = "JS Caller"
l_0_26.PARENT_CONTEXT = nil
l_0_26.FILELESS = "true"
l_0_26.CMDLINE_URL = "false"
l_0_26.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_26.BREAK_AT_FIRST_HIT_PHISH = "60"
l_0_26.script_zone = l_0_23 or ""
l_0_26.script_motw = l_0_25 or ""
l_0_26.script_path = l_0_21 or ""
local l_0_27 = CheckUrlReputationSimple(l_0_2, l_0_26, 60)
if l_0_27 then
  mp.set_mpattribute("Lua:AMSI.JS.BadDomainFound.S1")
end
return mp.CLEAN
