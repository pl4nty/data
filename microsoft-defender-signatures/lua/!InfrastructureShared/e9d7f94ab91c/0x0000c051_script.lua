-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e9d7f94ab91c\0x0000c051_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
  l_0_1 = (string.gsub)(l_0_1, "\"", "")
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC31: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC32: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

if not ("curl.exe")("mshta", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC45: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC47: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

if not (".txt")(".tiff", ".svg") then
  return mp.CLEAN
end
local l_0_4 = (mp.GetParentProcInfo)()
do
  if l_0_4 ~= nil and l_0_4.image_path ~= nil then
    local l_0_5 = (string.lower)(l_0_4.image_path)
    if l_0_5:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

