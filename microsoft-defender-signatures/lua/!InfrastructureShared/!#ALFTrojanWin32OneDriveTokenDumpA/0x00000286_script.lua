-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32OneDriveTokenDumpA\0x00000286_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME))
if l_0_0:find("onedrive.exe", 1, true) ~= 0 then
  return mp.INFECTED
end
return mp.CLEAN

