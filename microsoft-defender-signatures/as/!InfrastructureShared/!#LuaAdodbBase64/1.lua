-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAdodbBase64\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 10000 or l_0_0 > 100000 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
local l_0_2 = l_0_1:match("\'\"(.-)\r\n")
if l_0_2 == nil then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)(l_0_2, "[Base64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN

