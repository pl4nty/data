-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorASPExchgWebC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\\wwwroot\\serverpowerprocessing\\", 1, true) ~= nil or (string.find)(l_0_0, "\\executepowershell.aspx", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.match)(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") ~= nil or (string.find)(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or (string.match)(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") ~= nil or (string.find)(l_0_0, "\\inetpub\\wwwroot\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

