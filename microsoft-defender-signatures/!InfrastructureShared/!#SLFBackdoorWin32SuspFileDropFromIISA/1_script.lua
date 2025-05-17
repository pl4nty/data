-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorWin32SuspFileDropFromIISA\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:NewFileContextData:ProcName!w3wp.exe") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\\microsoft.net\\framework64\\v4.0.30319\\temporary asp.net files\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
do
  if l_0_1 ~= nil then
    local l_0_2 = GetTacticsTableForPid(l_0_1)
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if l_0_2.webshell_parent then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

