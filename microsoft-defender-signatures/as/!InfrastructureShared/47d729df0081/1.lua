-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\47d729df0081\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("\'", "")
l_0_1 = l_0_1:gsub("%s+", " ")
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC38: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

  if not (" iex")("invoke-expression", "iwr") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

