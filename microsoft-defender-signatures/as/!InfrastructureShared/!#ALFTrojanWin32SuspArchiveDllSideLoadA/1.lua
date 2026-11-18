-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/SuspArchiveDllSideLoad.A
-- Type: 10
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: ArchiveWithDllAndExec

local l_0_0 = mp.enum_mpattributesubstring("DllSideLoading_Vulnerable")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
l_0_0 = table_dedup(l_0_0)
set_research_data("VulnerableBinaries", table.concat(l_0_0, "|"), false)
return mp.INFECTED
