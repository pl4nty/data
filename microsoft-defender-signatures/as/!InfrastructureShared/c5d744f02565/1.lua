-- Threat: !InfrastructureShared
-- Name: c5d744f02565
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessAttributeValue(l_0_0, "inherit:PFApp_Parent")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.hstr_full_log()
if l_0_3 and (l_0_3[2].matched or l_0_3[3].matched) then
  local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("(powershell|pwsh).exe.*-e(nc)?\\s+([-A-Za-z0-9+/]{10,}=*)", l_0_2)
  if not l_0_4 then
    return mp.CLEAN
  end
end
local l_0_6 = ""
local l_0_7 = 1
local l_0_8 = ""
local l_0_9 = {}
local l_0_10 = "(?:(?i)FromBase64String\\(['\"]?)(\\$[\\w_]+|[-A-Za-z0-9+/]*={0,3})(?:['\"]?\\))"
local l_0_11, l_0_12 = MpCommon.StringRegExpSearch(l_0_10, l_0_2)
if l_0_11 and string.find(l_0_12, "$", 1, true) then
  local l_0_13 = string.match(l_0_12, "$([%w_]+)")
  if l_0_13 then
    local l_0_14 = l_0_13 .. "%s*=%s*" .. "([-%w/+]+=*)%s*;"
    local l_0_15 = string.match(l_0_2, l_0_14)
    if l_0_15 then
      if 35 < #l_0_15 then
        l_0_7 = l_0_7 + 10
      end
      local l_0_16 = MpCommon.Base64Decode(l_0_15)
      if l_0_16 then
        l_0_6 = l_0_16
      else
        l_0_7 = l_0_7 + 10
        l_0_8 = "obfuscated_var1"
      end
    else
      l_0_14 = l_0_13 .. "%s*=%s*" .. "[^;]+"
      l_0_15 = string.match(l_0_2, l_0_14)
      if l_0_15 and not string.find(l_0_15, "[A-Za-z]:\\[^%s]+") then
        l_0_7 = l_0_7 + 10
        l_0_8 = "obfuscated_var2"
      end
    end
  end
elseif l_0_11 then
  if 35 < #l_0_12 then
    l_0_7 = l_0_7 + 10
  end
  local l_0_17 = MpCommon.Base64Decode(l_0_12)
  if l_0_17 then
    l_0_6 = l_0_17
  else
    l_0_7 = l_0_7 + 10
    l_0_8 = "obfuscated_var3"
  end
elseif not l_0_11 then
  l_0_10 = "-e (\\$[\\w_]+|[-A-Za-z0-9+/]*={0,3})"
  l_0_11, l_0_12 = MpCommon.StringRegExpSearch(l_0_10, l_0_2)
  if l_0_11 then
    local l_0_18 = MpCommon.Base64Decode(l_0_12)
    if l_0_18 then
      l_0_6 = l_0_18
    else
      l_0_7 = l_0_7 + 10
      l_0_8 = "obfuscated_var5"
    end
  else
    l_0_7 = l_0_7 + 10
    l_0_8 = "obfuscated_var4"
  end
end
l_0_2 = string.lower(l_0_2)
l_0_6 = string.lower(l_0_6)
local l_0_19 = l_0_2 .. l_0_6
local l_0_20 = {
  ["[io.file]::writeallbytes"] = 5,
  ["system.reflection.assembly"] = 5,
  ["iisy.invoke"] = 5,
  tcplistener = 5,
  accepttcpclient = 5,
  tcpclient = 5,
  downloadstring = 5,
  ["[^r]shell[^.]"] = 5,
  ["cmd.exe"] = 5,
  defender = 30,
  scriptblock = 5,
  webrequest = 5,
  ["user-agent"] = 10,
  webclient = 5,
  ["unicode.getstring"] = 5,
  whoami = 5,
  ["net user"] = 5
}
for l_0_21, l_0_22 in pairs(l_0_20) do
  if string.find(l_0_19, l_0_21) then
    l_0_7 = l_0_7 + l_0_22
    l_0_8 = l_0_8 .. ";" .. l_0_21
  end
end
local l_0_23 = "((?i)(ftp|http[s]?)://[^\\\"\\s\\']+)"
local l_0_24, l_0_25 = MpCommon.StringRegExpSearch(l_0_23, l_0_19)
if l_0_24 then
  l_0_9.uri = l_0_25
  l_0_7 = l_0_7 + 10
  l_0_8 = l_0_8 .. ";url"
  l_0_24, _ = MpCommon.StringRegExpSearch(".(exe|dll|ps1|bat|rar)$", l_0_25)
  if l_0_24 then
    l_0_7 = l_0_7 + 10
    l_0_8 = l_0_8 .. ";file_extension"
  end
  if string.find(l_0_25, "%d+%.%d+%.%d+%.%d+") then
    l_0_7 = l_0_7 + 10
    l_0_8 = l_0_8 .. ";IP"
  end
  local l_0_26 = {}
  l_0_26.SIG_CONTEXT = "CMD"
  l_0_26.FILELESS = "true"
  l_0_26.CMDLINE_URL = "true"
  local l_0_27 = SafeGetUrlReputation({l_0_25}, l_0_26, false, 2000)
  if l_0_27 and l_0_27.urls[l_0_25] and l_0_27.urls[l_0_25].determination ~= 1 and l_0_27.urls[l_0_25].confidence >= 60 then
    l_0_9.detectorId = "BadUrlRep"
    l_0_9.confidence = l_0_27.urls[l_0_25].confidence
    l_0_9.determination = l_0_27.urls[l_0_25].determination
    l_0_7 = l_0_7 + 10
  end
end
if string.find(l_0_6, "frombase64string", 1, true) then
  l_0_7 = l_0_7 + 10
  l_0_8 = l_0_8 .. ";MultilayerEncoding"
end
l_0_9.Score = l_0_7
l_0_9.ProcessAttribute = l_0_1
l_0_9.Evidence = l_0_8

local function l_0_28(l_1_0)
  if l_0_3 and (l_0_3[2].matched or l_0_3[5].matched or l_0_3[3].matched) then
    return false
  end
  local l_1_1 = {
    "httpd",
    "w3wp",
    "sqlservr",
    "tomcat"
  }
  local l_1_2 = false
  for l_1_3, l_1_4 in ipairs(l_1_1) do
    if string.find(l_1_0, l_1_4) then
      l_1_2 = true
      break
    end
  end
  return l_1_2
end

local l_0_29, l_0_30
if l_0_28(l_0_1) and 30 < l_0_7 then
  l_0_9.Concrete = true
  l_0_29, l_0_30 = safeJsonSerialize(l_0_9, 150, nil, true)
  set_research_data("Evidence", MpCommon.Base64Encode(l_0_29), false)
  set_research_data("Error", MpCommon.Base64Encode(l_0_30), false)
  return mp.INFECTED
end
l_0_9.Concrete = false
l_0_29, l_0_30 = safeJsonSerialize(l_0_9, 150, nil, true)
set_research_data("Evidence", MpCommon.Base64Encode(l_0_29), false)
set_research_data("Error", MpCommon.Base64Encode(l_0_30), false)
return mp.LOWFI
