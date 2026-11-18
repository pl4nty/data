-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptExclusion.AA
-- Type: 13
-- MpAttributes: Lua:JSExt | Lua:VBSExt | BM_VBE_FILE | Nscript:Type_js | Nscript:Type_vbs | Lua:WSFExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0:find("officethememanager.js", 1, true) or l_0_0:find("networking-", 1, true) or l_0_0:find("onenotewebclipper", 1, true) or l_0_0:find("relaunch.wsf", 1, true) or l_0_0:find("nmagent", 1, true) then
    return mp.INFECTED
  end
  local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  if l_0_1:find("\\inetpub\\wwwroot\\", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
