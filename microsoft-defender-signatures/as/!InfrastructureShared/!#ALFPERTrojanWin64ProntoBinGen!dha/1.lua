-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERTrojanWin64ProntoBinGen!dha\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("ProntoBin") then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 ~= nil and (string.find)(l_0_0, "\\coding\\anti-scout\\working\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

