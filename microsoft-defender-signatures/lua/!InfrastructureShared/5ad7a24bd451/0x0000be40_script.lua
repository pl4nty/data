-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ad7a24bd451\0x0000be40_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC29: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

if not (".ru")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC42: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC43: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R5 in 'AssignReg'

if not ("irm")("invoke-restmethod", l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC55: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC56: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R6 in 'AssignReg'

if not ("access shield:")("commanti-bot", l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED

