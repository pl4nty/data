-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\126d77a5b7596\0x0000050b_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if IsTechniqueObservedForParents(l_0_0, "T1047", 2) or IsTechniqueObservedForParents(l_0_0, "T1021.006", 2) then
  return mp.INFECTED
end
return mp.LOWFI

