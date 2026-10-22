-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPythonAMSISca\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_SCANREASON)
if not l_0_0 or l_0_1 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if not l_0_2 or isnull(l_0_3) or type(l_0_3) ~= "string" then
  return mp.CLEAN
end
if l_0_3 ~= "Python" then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpIsPythonAMSIScan")
local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_4 and not isnull(l_0_5) and type(l_0_5) == "string" and l_0_5 == "PyAMSI:Behavior:v1" then
  (mp.set_mpattribute)("MpIsPyAMSIBehaviorV1Scan")
end
local l_0_6, l_0_7 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_6 or isnull(l_0_7) then
  return mp.CLEAN
end
if type(l_0_7) ~= "number" or l_0_7 <= 0 then
  return mp.CLEAN
end
local l_0_8, l_0_9 = pcall(sysio.GetFileNameFromProcess, l_0_7)
if not l_0_8 or isnull(l_0_9) or type(l_0_9) ~= "string" then
  return mp.CLEAN
end
local l_0_10 = ((string.lower)(l_0_9)):match("\\([^\\]+%.exe)$")
if isnull(l_0_10) then
  return mp.CLEAN
end
if l_0_10 == "python.exe" or l_0_10 == "pythonw.exe" then
  (mp.set_mpattribute)("MpIsStandalonePythonAMSIScan")
end
return mp.CLEAN

