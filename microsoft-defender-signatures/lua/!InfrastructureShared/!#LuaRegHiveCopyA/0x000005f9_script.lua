-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaRegHiveCopyA\0x000005f9_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows\\system32\\config\\s", 1, true) or (string.find)(l_0_1, "\\windows\\system32\\config\\regback\\s", 1, true) or (string.find)(l_0_1, "\\sppcbshivestore\\", 1, true) or (string.find)(l_0_1, "\\adaptivacache\\os", 1, true) or (string.find)(l_0_1, "\\sources\\install", 1, true) or (string.find)(l_0_1, "\\amp\\tmp\\", 1, true) or (string.find)(l_0_1, "\\ntuser.dat", 1, true) or (string.find)(l_0_1, "\\docker\\windowsfilter\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if (string.find)(l_0_2, "ir_agent.exe", 1, true) or (string.find)(l_0_2, "ccsvchst.exe", 1, true) or (string.find)(l_0_2, "mssense.exe", 1, true) or (string.find)(l_0_2, "userprofilemanager.exe", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_2, "svchost.exe", 1, true) then
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
  if (string.find)(l_0_4, "localService -p -s RemoteRegistry", 1, true) then
    (mp.set_mpattribute)("Lua:RemoteRegServiceRegHiveCopy.A")
  end
end
do
  return mp.INFECTED
end

