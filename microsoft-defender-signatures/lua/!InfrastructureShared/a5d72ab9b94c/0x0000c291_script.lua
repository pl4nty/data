-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a5d72ab9b94c\0x0000c291_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil and l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if not l_0_1:match("([^\\]+)$") == "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = (string.gsub)((string.lower)(l_0_3), "\\\"|[-;]+(?=s*[\"\'])?", "")
local l_0_4 = {}
-- DECOMPILER ERROR at PC55: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC56: Overwrote pending register: R5 in 'AssignReg'

if not ("http")(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC68: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC69: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Overwrote pending register: R7 in 'AssignReg'

if not ("curl")("minimized", l_0_5) then
  return mp.CLEAN
end
do
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC87: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R9 in 'AssignReg'

  if not ("guard:")("cdn trace id:", "gatecheck:") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

