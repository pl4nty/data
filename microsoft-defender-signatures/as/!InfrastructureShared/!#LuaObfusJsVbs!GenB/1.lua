-- Threat: !InfrastructureShared
-- Name: !#Lua:ObfusJsVbs!Gen.B
-- Type: 13
-- Includes: PHelpers
-- MpAttributes: Lua:JsObfus.B

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if true == IsInternetCache(l_0_1) or true == IsLowConfNPath(l_0_1) then
  return mp.CLEAN
end
if l_0_1:find("\\program files\\", 1, true) or l_0_1:find("\\clientaccess\\owa\\prem\\", 1, true) or l_0_1:find(":\\windows\\", 1, true) or l_0_1:find(":\\program files (x86)\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\default\\extensions\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\profile", 1, true) or l_0_1:find("\\device\\harddiskvolume", 1, true) or l_0_1:find(":\\inetpub\\", 1, true) or l_0_1:find("\\netlogon\\", 1, true) or l_0_1:find(":\\programdata\\microsoft\\grouppolicy\\users\\", 1, true) or l_0_1:find("\\mozilla\\firefox\\profiles\\", 1, true) or l_0_1:find("\\programdata\\lenovo\\userguide", 1, true) or l_0_1:find("\\google\\chrome\\user data\\default\\extensions", 1, true) or l_0_1:find("\\appdata\\roaming\\aida\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "^\\\\[^\\]+\\") then
  return mp.CLEAN
end
if l_0_2:find("support_menu.vbs", 1, true) or l_0_1:find("bku_plus_connect.vbs", 1, true) or l_0_1:find("replaceagent.vbs", 1, true) or l_0_1:find("install.vbs", 1, true) or l_0_1:find("setdefaultappbyprotocol.vbs", 1, true) or l_0_1:find("gis-admin_cfg_", 1, true) or l_0_1:find("mk_inventory.vbs", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower()
if l_0_3 ~= nil then
  local l_0_4 = l_0_3:match("[^\\]+$")
  local l_0_5 = {
    ["wscript.exe"] = "",
    ["cscript.exe"] = "",
    ["explorer.exe"] = ""
  }
  if l_0_4 ~= nil and l_0_5[l_0_4] then
    return mp.INFECTED
  end
end
return mp.CLEAN
