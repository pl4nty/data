-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\734170bd7092\0x000002b9_luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetURI)()
local l_0_1 = l_0_0:match("?auth_signature=([a-f0-9]+)")
if l_0_1 ~= nil and #l_0_1 == 32 then
  return mp.INFECTED
end
return mp.CLEAN

