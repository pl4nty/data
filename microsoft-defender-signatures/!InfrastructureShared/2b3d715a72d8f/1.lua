-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b3d715a72d8f\1.luac 

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
if not contains(l_0_3, "http") then
  return mp.CLEAN
end
local l_0_4, l_0_5 = (string.gsub)(l_0_3, "^", "")
if l_0_4 then
  local l_0_6 = contains
  local l_0_7 = l_0_4
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC74: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R6 in 'AssignReg'

  if l_0_6 then
    return l_0_6
  end
end
do
  do
    -- DECOMPILER ERROR at PC81: Overwrote pending register: R6 in 'AssignReg'

    do return l_0_6.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

