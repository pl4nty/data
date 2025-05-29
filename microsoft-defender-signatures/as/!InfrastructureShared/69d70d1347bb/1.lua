-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69d70d1347bb\1.luac 

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
-- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

if not ("iex")("invoke-expression", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC43: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R5 in 'AssignReg'

if not ("invoke-webrequest")("iwr", l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC56: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC57: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R6 in 'AssignReg'

if not ("-useb")("-usebasicparsing", l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED

