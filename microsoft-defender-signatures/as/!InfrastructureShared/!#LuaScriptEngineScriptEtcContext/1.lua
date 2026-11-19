-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptEngineScriptEtcContext
-- Type: 12
-- MpAttributes: Lua:JSExt | Lua:VBSExt | Lua:LNKExt | Lua:CMDExt | Lua:BATExt | Lua:DLLExt | Lua:EXEExt

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower()
local l_0_1 = l_0_0:match("[^\\]+$")
local l_0_2 = {
  ["iexplore.exe"] = "",
  ["chrome.exe"] = "",
  ["firefox.exe"] = ""
}
local l_0_3 = {
  ["wscript.exe"] = "",
  ["cscript.exe"] = ""
}
if l_0_1 == nil or l_0_2[l_0_1] then
  return mp.CLEAN
end
if l_0_3[l_0_1] then
  return mp.INFECTED
end
return mp.CLEAN
