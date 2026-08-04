-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\61d7b7441f5b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC27: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R5 in 'AssignReg'

if not ("invoke-webrequest")("invoke-expression", "| invoke-expression") then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC39: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC42: Overwrote pending register: R6 in 'AssignReg'

  if ("w3wp.exe")("cmdhstr", "|iex") then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

