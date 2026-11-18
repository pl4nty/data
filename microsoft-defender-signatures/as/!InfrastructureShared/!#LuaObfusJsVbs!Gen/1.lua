-- Threat: !InfrastructureShared
-- Name: !#Lua:ObfusJsVbs!Gen
-- Type: 13
-- Includes: PHelpers
-- MpAttributes: Lua:JsObfus.B

local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 400000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_1 == nil then
  return mp.CLEAN
end
if true == IsInternetCache(l_0_1) or true == IsLowConfNPath(l_0_1) then
  return mp.CLEAN
end
if l_0_1:find("\\program files\\", 1, true) or l_0_1:find("\\clientaccess\\owa\\prem\\", 1, true) or l_0_1:find(":\\windows\\", 1, true) or l_0_1:find(":\\program files (x86)\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\default\\extensions\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\profile", 1, true) or l_0_1:find("\\device\\harddiskvolume", 1, true) or l_0_1:find(":\\inetpub\\", 1, true) or l_0_1:find("\\netlogon\\", 1, true) or l_0_1:find(":\\programdata\\microsoft\\grouppolicy\\users\\", 1, true) or l_0_1:find("\\mozilla\\firefox\\profiles\\", 1, true) or l_0_1:find("\\programdata\\lenovo\\userguide", 1, true) or l_0_1:find("\\$recycle.bin\\", 1, true) or l_0_1:find("\\google\\chrome\\user data\\default\\extensions", 1, true) or l_0_1:find("\\appdata\\roaming\\aida\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
