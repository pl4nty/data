-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b31339e45e\0x000010c8_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not contains(l_0_0, (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")) then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC32: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R4 in 'AssignReg'

  if (":\\programData\\")(":\\perflogs\\", ":\\wmpub\\") then
    reportSessionInformationInclusive()
    add_parents()
    reportTimingData()
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

