-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25404b5af0af\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("RPF:TopLevelFile") == false then
  return mp.CLEAN
end
if (mp.get_mpattribute)("ValidDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = {}
-- DECOMPILER ERROR at PC23: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("\\system32\\").getfilename)()
-- DECOMPILER ERROR at PC29: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC36: Overwrote pending register: R4 in 'AssignReg'

if l_0_1 and contains(l_0_1, "\\program files (x86)\\") then
  return mp.CLEAN
end
return mp.INFECTED

