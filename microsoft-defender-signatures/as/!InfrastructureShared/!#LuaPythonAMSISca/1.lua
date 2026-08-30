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
local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_4 or isnull(l_0_5) then
  return mp.CLEAN
end
if type(l_0_5) ~= "number" or l_0_5 <= 0 then
  return mp.CLEAN
end
local l_0_6, l_0_7 = pcall(sysio.GetFileNameFromProcess, l_0_5)
if not l_0_6 or isnull(l_0_7) or type(l_0_7) ~= "string" then
  return mp.CLEAN
end
local l_0_8 = ((string.lower)(l_0_7)):match("\\([^\\]+%.exe)$")
if isnull(l_0_8) then
  return mp.CLEAN
end
if l_0_8 == "python.exe" or l_0_8 == "pythonw.exe" then
  (mp.set_mpattribute)("MpIsStandalonePythonAMSIScan")
end
return mp.CLEAN

