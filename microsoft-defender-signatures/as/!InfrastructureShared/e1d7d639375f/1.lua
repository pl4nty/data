-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e1d7d639375f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.gsub)((string.lower)(l_0_1), "[%\'\"]%)?%+%(?[%\'\"]", "")
local l_0_2 = {}
-- DECOMPILER ERROR at PC34: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

if not ("net.webclient")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC46: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

if not ("downloadstring")(l_0_1, l_0_3) then
  return mp.CLEAN
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC77: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R7 in 'AssignReg'

  if not (".shop/")(".hair/", ".lat/") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

