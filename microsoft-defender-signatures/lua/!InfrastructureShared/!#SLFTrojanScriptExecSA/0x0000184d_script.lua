-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanScriptExecSA\0x0000184d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "cscript.exe" and l_0_0 ~= "wscript.exe " then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:find("\\downloads\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

