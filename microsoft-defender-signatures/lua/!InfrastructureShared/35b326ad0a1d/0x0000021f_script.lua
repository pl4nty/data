-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b326ad0a1d\0x0000021f_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall((bm.GetMemQueryCount)())
if l_0_1 ~= nil and l_0_1 > 0 then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN

