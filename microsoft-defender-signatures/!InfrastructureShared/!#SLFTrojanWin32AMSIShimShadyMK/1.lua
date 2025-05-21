-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32AMSIShimShadyMK\1.luac 

-- params : ...
-- function num : 0
(mp.readprotection)(false)
local l_0_0, l_0_1 = pcall(mp.getfilesize)
if not l_0_0 or isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.readfile)(0, l_0_1)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
;
(mp.readprotection)(true)
local l_0_3 = {}
-- DECOMPILER ERROR at PC45: No list found for R3 , SetList fails

local l_0_4 = {}
-- DECOMPILER ERROR at PC47: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC49: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC50: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = "P\000a\000t\000c\000h\000W\0003\0002\000"
-- DECOMPILER ERROR at PC52: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R8 in 'AssignReg'

if (("P\000a\000t\000c\000h\000W\0006\0004\000").find)("I\000g\000n\000o\000r\000e\000L\000o\000a\000d\000L\000i\000b\000r\000a\000r\000y\000", "R\000e\000d\000i\000r\000e\000c\000t\000E\000X\000E\000", 1, true) ~= nil and (string.find)(l_0_2, "a\000m\000s\000i\000.\000d\000l\000l", 1, true) ~= nil then
  if l_0_5(l_0_2, l_0_3) then
    set_research_data("[=>] FIX_IDS", tostring(l_0_3), false)
    return mp.INFECTED
  end
  if l_0_5(l_0_2, l_0_4) then
    set_research_data("[=>] FIX_IDS", tostring(l_0_4), false)
    return mp.INFECTED
  end
end
return mp.CLEAN

