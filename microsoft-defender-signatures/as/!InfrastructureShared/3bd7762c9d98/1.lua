-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3bd7762c9d98\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("\'", "")
l_0_1 = l_0_1:gsub(",", "")
l_0_1 = l_0_1:gsub("%s+", " ")
local l_0_2 = GetRollingQueueKeys("IsClickFixCMD_Malicious")
if l_0_2 == nil then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC66: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R6 in 'AssignReg'

  if not (" iex")("invoke-expression", "iwr") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

