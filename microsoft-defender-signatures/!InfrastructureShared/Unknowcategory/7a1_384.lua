-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7a1_384.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((MpCommon.PathToWin32Path)((mp.getfilename)(mp.FILEPATH_QUERY_FULL))):lower()
if l_0_0:find("kali", 1, true) or l_0_0:find("nethunter", 1, true) or l_0_0:find("exploitdb", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

