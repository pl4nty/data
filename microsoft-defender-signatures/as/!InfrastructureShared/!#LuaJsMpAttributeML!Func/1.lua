-- Threat: !InfrastructureShared
-- Name: !#Lua:JsMpAttributeML!Func
-- Type: 13
-- Includes: PHelpers
-- MpAttributes: Nscript:Type_js & BM_TEXT_FILE & !Lua:JSExclusions

local l_0_0 = mp.getfilesize()
if l_0_0 <= 1000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
local l_0_3 = string.sub(l_0_2, -3)
local l_0_4 = string.sub(l_0_2, -4)
if l_0_3 ~= ".js" and l_0_4 ~= ".jse" then
  return mp.CLEAN
end
if true == IsInternetCache(l_0_1) or true == IsLowConfNPath(l_0_1) then
  return mp.CLEAN
end
if l_0_1:find("\\program files\\", 1, true) or l_0_1:find("\\node_modules\\", 1, true) or l_0_1:find("\\crx_install\\", 1, true) or l_0_1:find("\\resources\\app\\shared\\", 1, true) or l_0_1:find("\\user data\\default\\extensions\\", 1, true) or l_0_1:find("\\clientaccess\\owa\\prem\\", 1, true) or l_0_1:find(":\\windows\\", 1, true) or l_0_1:find(":\\program files (x86)\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\default\\extensions\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\profile", 1, true) or l_0_1:find("\\device\\harddiskvolume", 1, true) or l_0_1:find(":\\inetpub\\", 1, true) or l_0_1:find("\\netlogon\\", 1, true) or l_0_1:find("\\device\\vhdharddisk", 1, true) or l_0_1:find(":\\programdata\\microsoft\\grouppolicy\\users\\", 1, true) or l_0_1:find("\\mozilla\\firefox\\profiles\\", 1, true) or l_0_1:find("\\programdata\\lenovo\\userguide", 1, true) or l_0_1:find("\\appdata\\roaming\\aida\\", 1, true) or l_0_1:find("\\newos\\windows\\system32\\", 1, true) or l_0_1:find("\\sentinel\\cache\\", 1, true) or l_0_1:find("\\backup\\", 1, true) then
  return mp.CLEAN
end
if l_0_2:find("login_settings_gpc30.vbs", 1, true) or l_0_1:find("toc13.js", 1, true) or l_0_1:find("mcafeecertinstall_slt.vbs", 1, true) then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:JsMpAttributeML")
return mp.CLEAN
