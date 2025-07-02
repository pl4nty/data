-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e9d7a3844a51\1.luac 

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
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
if #l_0_3 < 50 then
  return mp.CLEAN
end
if #l_0_3 > 400 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = (string.gsub)(l_0_3, "[\"\'`^()+#&]", "")
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC78: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R8 in 'AssignReg'

  if ("iwr")("iex", "irm") then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

