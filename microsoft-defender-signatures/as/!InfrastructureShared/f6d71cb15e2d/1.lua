-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f6d71cb15e2d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
if #l_0_1 > 450 then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC28: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC29: Overwrote pending register: R3 in 'AssignReg'

if ("w3wp.exe")("cmdhstr", l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN

