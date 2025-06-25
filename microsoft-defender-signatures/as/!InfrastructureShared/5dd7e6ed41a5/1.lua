-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5dd7e6ed41a5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.gsub)(l_0_1, "[\"\'`^()+#&]", "")
local l_0_3 = contains
local l_0_4 = l_0_2
local l_0_5 = {}
-- DECOMPILER ERROR at PC29: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

if not l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC36: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R6 in 'AssignReg'

l_0_3, l_0_5 = l_0_3(l_0_4, l_0_5), {"getstream();[byte[]]"}
if not l_0_3 then
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end
l_0_3 = contains
-- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

l_0_3, l_0_5 = l_0_3(l_0_4, l_0_5), {".read"}
if not l_0_3 then
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end
l_0_3 = mp
l_0_3 = l_0_3.INFECTED
return l_0_3

