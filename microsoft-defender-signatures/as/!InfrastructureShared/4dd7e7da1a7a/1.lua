-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7e7da1a7a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC21: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC22: Overwrote pending register: R3 in 'AssignReg'

if ("%:\\windows\\.*%.bat")(l_0_1, l_0_2, false) then
  return mp.INFECTED
end
return mp.CLEAN

