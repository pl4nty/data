-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3941ed731068\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetURI)()
local l_0_1 = l_0_0:match("(%d+.%d+%.%d+%.%d+)")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if isPublicIP(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

