-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c6d7eb0f21aa\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC27: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("python")("trufflehog") do
  if (string.find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED

