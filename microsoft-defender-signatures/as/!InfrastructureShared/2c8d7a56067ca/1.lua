-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c8d7a56067ca\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC24: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC26: Overwrote pending register: R4 in 'AssignReg'

if not ("mshta")("http", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  if l_0_3 ~= nil and l_0_3.image_path ~= nil then
    local l_0_4 = (string.lower)(l_0_3.image_path)
    if l_0_4:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

