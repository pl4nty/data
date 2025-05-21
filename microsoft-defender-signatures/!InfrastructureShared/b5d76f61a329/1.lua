-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b5d76f61a329\1.luac 

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
l_0_3 = (string.lower)(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
if #l_0_3 > 500 then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC62: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC63: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R6 in 'AssignReg'

if not ("product call install")("http", l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED

