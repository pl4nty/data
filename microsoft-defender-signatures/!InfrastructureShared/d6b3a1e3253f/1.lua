-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3a1e3253f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not contains(l_0_0, (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")) then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC35: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

  if (":\\programData\\megasync.exe")(":\\programData\\megacmdserver.exe", ":\\programData\\megaupdater.exe") then
    reportSessionInformation()
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

