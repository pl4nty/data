-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73d727f1feb1\0x0000c24c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 70 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 == nil and l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_4 = nil
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC72: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R5 in 'AssignReg'

  if not l_0_5 then
    return l_0_5
  end
  -- DECOMPILER ERROR at PC83: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R5 in 'AssignReg'

  do return l_0_5 end
  -- WARNING: undefined locals caused missing assignments!
end

