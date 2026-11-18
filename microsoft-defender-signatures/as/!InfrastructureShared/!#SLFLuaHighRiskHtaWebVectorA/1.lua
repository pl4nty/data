-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaHighRiskHtaWebVector.A
-- Type: 13
-- Includes: GetEmailPaths
-- MpAttributes: Lua:HTAExt & (BM_HTA_FILE | SCPT:JS/BASE64 | SLF:FindJSC)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
local l_0_1 = {
  ["outlook.exe"] = "",
  ["iexplore.exe"] = "",
  ["browser_broker.exe"] = "",
  ["firefox.exe"] = "",
  ["chrome.exe"] = "",
  ["winword.exe"] = "",
  ["powerpnt.exe"] = "",
  ["excel.exe"] = "",
  ["acrord32.exe"] = "",
  ["slack.exe"] = ""
}
local l_0_2 = false
local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if (l_0_1[l_0_3] or isOutlookProcess(l_0_3)) and l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  l_0_2 = true
elseif mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and l_0_0 == mp.SCANREASON_ONOPEN then
  local l_0_4 = mp.GetMOTWZone()
  if l_0_4 == 3 or l_0_4 == 4 then
    l_0_2 = true
  end
end
local l_0_5 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_6 = string.lower(l_0_5)
if 17 <= #l_0_6 and l_0_6:sub(2, 17) == ":\\program files\\" or 23 <= #l_0_6 and l_0_6:sub(2, 23) == ":\\program files (x86)\\" or 11 <= #l_0_6 and l_0_6:sub(2, 11) == ":\\windows\\" then
  return mp.CLEAN
end
if l_0_2 then
  mp.set_mpattribute("MpDisableCaching")
  MpCommon.AppendPersistContext(l_0_5, "Lua:HighRiskHtaWebVector", 0)
  return mp.INFECTED
end
return mp.CLEAN
