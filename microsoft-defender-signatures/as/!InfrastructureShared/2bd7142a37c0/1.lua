-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2bd7142a37c0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = {}
-- DECOMPILER ERROR at PC24: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R4 in 'AssignReg'

local l_0_3 = (("chrome.exe").GetProcessCommandLine)("firefox.exe")
local l_0_4 = {}
-- DECOMPILER ERROR at PC30: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC31: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

if l_0_3 == nil then
  return ("edge.exe").CLEAN
end
-- DECOMPILER ERROR at PC38: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R7 in 'AssignReg'

if not contains("brave.exe", "opera.exe") then
  return mp.CLEAN
end
if not contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = (mp.GetScannedPPID)()
if l_0_5 == "" or l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = (mp.GetProcessCommandLine)(l_0_5)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = (string.lower)(l_0_6)
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC111: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R10 in 'AssignReg'

  if not ("invoke")("iex", "bypass") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

