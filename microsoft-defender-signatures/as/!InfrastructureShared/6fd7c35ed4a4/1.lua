-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6fd7c35ed4a4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 20 then
  return mp.CLEAN
end
l_0_1 = (string.gsub)((string.lower)(l_0_1), "[%\'\"]%)?%+%(?[%\'\"]", "")
local l_0_2 = {}
-- DECOMPILER ERROR at PC34: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

if not ("verification")(l_0_1, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED

