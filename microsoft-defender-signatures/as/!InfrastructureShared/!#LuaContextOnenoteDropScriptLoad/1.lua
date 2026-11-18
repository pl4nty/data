-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/OnenoteDropScriptLoad
-- Type: 13
-- MpAttributes: (Lua:VBSExt | Lua:JSExt | Lua:WSFExt | Lua:HTAExt) & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & MpNewlyCreatedHint

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "cscript.exe" and l_0_0 ~= "wscript.exe" and l_0_0 ~= "mshta.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.image_path
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_3, "([^\\]+)$")
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_4)
if l_0_0 == "wscript.exe" and l_0_4 == "onenote.exe" then
  mp.set_mpattribute("Lua:Context/OnenoteDropWscriptLoad")
elseif l_0_0 == "cscript.exe" and l_0_4 == "onenote.exe" then
  mp.set_mpattribute("Lua:Context/OnenoteDropCscriptLoad")
elseif l_0_0 == "mshta.exe" and l_0_4 == "onenote.exe" then
  mp.set_mpattribute("Lua:Context/OnenoteDropMshtaLoad")
end
return mp.CLEAN
