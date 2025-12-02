-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3dd7263f0d61\1.luac 

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
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC29: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R5 in 'AssignReg'

if not (" iex")("invoke-expression", "iwr") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  if l_0_3 ~= nil then
    local l_0_4 = (string.lower)(l_0_3.image_path)
    -- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

    if l_0_4:match("([^\\]+)$") == "node.exe" or l_0_4:match("([^\\]+)$") == "npm.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

