-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptExclusionAA\0x0000194f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  if l_0_0:find("officethememanager.js", 1, true) or l_0_0:find("networking-", 1, true) or l_0_0:find("onenotewebclipper", 1, true) or l_0_0:find("relaunch.wsf", 1, true) or l_0_0:find("nmagent", 1, true) then
    return mp.INFECTED
  end
  local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  if l_0_1:find("\\inetpub\\wwwroot\\", 1, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

