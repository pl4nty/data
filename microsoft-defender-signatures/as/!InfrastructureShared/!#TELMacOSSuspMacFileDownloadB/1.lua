-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspMacFileDownload.B
-- Type: 13
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen)))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = macos.GetDownloadUrl()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = string.match(l_0_2, "^(%w+)://([^:/]+)")
if l_0_3 == "" or l_0_3 == nil or l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3 .. "://" .. l_0_4
local l_0_6, l_0_7 = mp.CheckUrl(l_0_5)
if l_0_6 == 1 and l_0_7 == 1 then
  return mp.CLEAN
end
local l_0_8 = {}
l_0_8.SIG_CONTEXT = "LUA_GENERIC"
l_0_8.TAG = "MAC_INITIAL_ACCESS"
local l_0_9 = SafeGetUrlReputation({l_0_5}, l_0_8, false, 2000)
if l_0_9 and l_0_9.urls[l_0_5] and (l_0_9.urls[l_0_5].determination == 2 or l_0_9.urls[l_0_5].determination == 3 or l_0_9.urls[l_0_5].determination == 5 or l_0_9.urls[l_0_5].determination == 6 or l_0_9.urls[l_0_5].determination == 7) then
  return mp.INFECTED
end
return mp.CLEAN
