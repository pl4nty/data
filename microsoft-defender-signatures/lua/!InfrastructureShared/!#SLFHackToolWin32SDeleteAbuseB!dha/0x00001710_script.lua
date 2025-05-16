-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFHackToolWin32SDeleteAbuseB!dha\0x00001710_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil then
  if (string.find)(l_0_0, "->(vfs:", 1, true) then
    return mp.INFECTED
  else
    if (string.find)(l_0_0, "->[msilres:", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

