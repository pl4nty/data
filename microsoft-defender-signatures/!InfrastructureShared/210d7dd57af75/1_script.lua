-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\210d7dd57af75\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC28: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC29: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R5 in 'AssignReg'

if not ("iex")("item alias:", "mshta") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  do
    if l_0_3 ~= nil and l_0_3.image_path ~= nil then
      local l_0_4 = (string.lower)(l_0_3.image_path)
      -- DECOMPILER ERROR at PC50: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC51: Overwrote pending register: R7 in 'AssignReg'

      if l_0_4:match("invoke-expression") == "explorer.exe" then
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

