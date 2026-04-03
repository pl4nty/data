-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43d724ff0103\1.luac 

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
if not (string.find)(l_0_1, "--app=", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC47: No list found for R2 , SetList fails

local l_0_3 = false
-- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

for l_0_7,l_0_8 in ("\\tmp\\")("\\downloads\\") do
  if (string.find)(l_0_1, l_0_8, 1, true) then
    break
  end
end
do
  do
    if not l_0_3 then
      return mp.CLEAN
    end
    TrackPidAndTechniqueBM("CMDHSTR", "T1218.015", "ElectronAppOverride")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

