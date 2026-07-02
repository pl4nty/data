-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptInZipUserExecutionA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or #l_0_0 <= 10 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "wscript.exe" and l_0_0 ~= "cscript.exe" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.GetProcessAttributes)(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
for l_0_6,l_0_7 in ipairs(l_0_2) do
  if (string.find)(l_0_7, "BM:ScriptInZipUserExecution", 1, true) ~= nil then
    (mp.set_mpattribute)("Lua:" .. l_0_7)
  end
end
return mp.CLEAN

