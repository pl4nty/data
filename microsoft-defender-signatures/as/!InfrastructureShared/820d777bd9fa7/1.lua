-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\820d777bd9fa7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
if (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.INFECTED
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
l_0_3 = (string.lower)(l_0_3)
if l_0_3 then
  local l_0_4 = contains
  local l_0_5 = l_0_3
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC58: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R4 in 'AssignReg'

  if l_0_4 then
    return l_0_4
  end
end
do
  do
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R4 in 'AssignReg'

    do return l_0_4.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

