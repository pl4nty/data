-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFRenamedRcloneSB\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:PeOriginalName!rclone.exe") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC35: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

  if ("\\program files")("\\rclone.exe", "\\cmmagent.exe") then
    return mp.CLEAN
  else
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

