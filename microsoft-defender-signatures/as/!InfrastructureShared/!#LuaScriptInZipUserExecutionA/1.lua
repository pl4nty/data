-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptInZipUserExecution.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & MpNewlyCreatedHint
-- ProcessAttributes: BM:ScriptInZipUserExecution.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or #l_0_0 <= 10 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "wscript.exe" and l_0_0 ~= "cscript.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetProcessAttributes(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_4, "BM:ScriptInZipUserExecution", 1, true) ~= nil then
    mp.set_mpattribute("Lua:" .. l_0_4)
  end
end
return mp.CLEAN
