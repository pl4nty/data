-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/NewExcelInTemplates
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpNewlyCreatedHint & Lua:MsExcelExt & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if StringEndsWith(l_0_0, "microsoft office (x86)\\templates") or StringEndsWith(l_0_0, "microsoft office\\templates") or StringEndsWith(l_0_0, "microsoft office\\root\\templates") then
  mp.set_mpattribute("Lua:Context/NewExcelInTemplates")
end
return mp.CLEAN
