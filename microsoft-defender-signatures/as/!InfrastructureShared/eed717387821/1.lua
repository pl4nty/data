-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\eed717387821\1.luac 

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
-- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R5 in 'AssignReg'

if not ("payload")("$env:temp", "verifying your identity") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  if l_0_3 ~= nil and l_0_3.image_path ~= nil then
    local l_0_4 = (string.lower)(l_0_3.image_path)
    -- DECOMPILER ERROR at PC52: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC53: Overwrote pending register: R7 in 'AssignReg'

    if l_0_4:match("flipper") == "explorer.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

