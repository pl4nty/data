-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAJSGootKitzD\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 4096 and l_0_0 < 716800 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = tostring((mp.readfile)(300000, 400000))
;
(mp.readprotection)(true)
if (MpCommon.StringRegExpSearch)("[a-zA-Z]=\'[a-z?].*?\\+\\\\", (string.lower)(l_0_1)) == true then
  return mp.INFECTED
end
return mp.CLEAN

