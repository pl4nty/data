-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\29d71d8e86cc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (string.find)(l_0_1, "wmic", 1, true) or not (string.find)(l_0_1, "/format:", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC59: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC60: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("/format:csv")("/format:list") do
  -- DECOMPILER ERROR at PC64: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R11 in 'AssignReg'

  if (("/format:htable").find)("/format:hform", "/format:textvaluelist", "/format:xml", true) then
    return mp.CLEAN
  end
end
local l_0_8 = (string.match)(l_0_1, "/format:(%S+)")
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = (string.find)(l_0_8, "http", 1, true)
local l_0_10 = (string.find)(l_0_8, ".xsl", 1, true)
local l_0_11 = (string.find)(l_0_8, "\\\\", 1, true)
if not l_0_9 and not l_0_10 and not l_0_11 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1220", "SuspWmicXslProcess")
return mp.INFECTED

