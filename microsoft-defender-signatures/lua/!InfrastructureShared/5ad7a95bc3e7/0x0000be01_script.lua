-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ad7a95bc3e7\0x0000be01_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if #l_0_1 <= 60 then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC34: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC36: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC37: Overwrote pending register: R5 in 'AssignReg'

if not ("iex")("invoke-expression", "invoke-webrequest") then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC46: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R6 in 'AssignReg'

  if not ("hidden")(l_0_1, "iwr") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

