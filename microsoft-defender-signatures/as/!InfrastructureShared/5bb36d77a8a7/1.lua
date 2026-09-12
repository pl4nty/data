-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb36d77a8a7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(tostring(l_0_0.utf8p2))
local l_0_2 = {}
-- DECOMPILER ERROR at PC26: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R5 in 'AssignReg'

if not ("-nop -w h")("-w hidden", "-windowstyle hidden") then
  return mp.CLEAN
end
return mp.INFECTED

