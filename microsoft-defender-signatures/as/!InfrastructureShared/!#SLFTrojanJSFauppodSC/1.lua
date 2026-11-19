-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/Fauppod.SC
-- Type: 24
-- Includes: ResearchData, LuaFuncHelper
-- MpAttributes: LUA:ZipWithMotwAll

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:find(".zip->version.", 1, true) and StringEndsWith(l_0_0, ".js") then
  set_research_data("IOAVUrl", MpCommon.Base64Encode(mp.IOAVGetDownloadUrl()), false)
  return mp.INFECTED
end
return mp.CLEAN
