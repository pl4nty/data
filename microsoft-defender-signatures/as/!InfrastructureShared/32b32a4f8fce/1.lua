-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b32a4f8fce\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not contains(l_0_0, (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC33: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC34: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC36: Overwrote pending register: R4 in 'AssignReg'

if (":\\programData\\rclone.exe")(":\\programData\\usoshared\\", ":\\perflogs\\") then
  reportSessionInformationInclusive()
  add_parents()
  reportTimingData()
  local l_0_2, l_0_3 = pcall(reportBmInfo)
  -- DECOMPILER ERROR at PC55: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R7 in 'AssignReg'

  if not l_0_2 and l_0_3 then
    (bm.add_related_string)(":\\windows\\help\\", (":\\windows\\debug\\")(":\\windows\\tapi\\"), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

