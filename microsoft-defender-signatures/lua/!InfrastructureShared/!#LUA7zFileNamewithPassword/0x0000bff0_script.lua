-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUA7zFileNamewithPassword\0x0000bff0_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or (string.len)(l_0_0) <= 5 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "--✵ᴘ�\128$$ᴡØ�\128𝒟", 1, true) ~= nil or (string.find)(l_0_0, "Pa$$CŌ𝔻e--", 1, true) ~= nil or (string.find)(l_0_0, "𝗣𝗮𝘀𝘀𝘄𝗼𝗿𝗱2025", 1, true) ~= nil or (string.find)(l_0_0, "-𝐒𝑒𝓉𝓊𝓅⚙️2025", 1, true) ~= nil then
  (mp.set_mpattribute)("LUA:7zHasFileNamewithPassword")
  return mp.INFECTED
end
return mp.CLEAN

