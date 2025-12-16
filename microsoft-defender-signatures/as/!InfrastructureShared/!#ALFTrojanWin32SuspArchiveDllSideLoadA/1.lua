-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SuspArchiveDllSideLoadA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("DllSideLoading_Vulnerable")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
l_0_0 = table_dedup(l_0_0)
set_research_data("VulnerableBinaries", (table.concat)(l_0_0, "|"), false)
return mp.INFECTED

