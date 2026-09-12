-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4bd7e5d76b7d\1.luac 

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
local l_0_2 = {}
-- DECOMPILER ERROR at PC32: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

if not ("http")(l_0_1, l_0_2) then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC49: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R6 in 'AssignReg'

  if not (" iex")("invoke-expression", "iwr") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

