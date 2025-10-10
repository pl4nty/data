-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb384f1d1e7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = GetFileName(l_0_0.image_path)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC24: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC26: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R5 in 'AssignReg'

  if ("wmiprvse.exe")("wsmprovhost.exe", "winrshost.exe") then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

