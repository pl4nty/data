-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\196b3084d32e5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())))
local l_0_1 = nil
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
  l_0_1 = ((this_sigattrlog[6]).utf8p1):lower()
end
local l_0_2 = (string.match)(l_0_1, "(.*\\)")
local l_0_3 = (string.match)(l_0_0, "(.*\\)")
if l_0_2 == l_0_3 then
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN

