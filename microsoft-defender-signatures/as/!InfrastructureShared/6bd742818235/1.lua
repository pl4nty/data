-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6bd742818235\1.luac 

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
-- DECOMPILER ERROR at PC32: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC35: Overwrote pending register: R5 in 'AssignReg'

if not (" iex")("invoke-expression", "iwr") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  do
    if l_0_3 ~= nil then
      local l_0_4 = (string.lower)(l_0_3.image_path)
      -- DECOMPILER ERROR at PC51: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC52: Overwrote pending register: R7 in 'AssignReg'

      if l_0_4:match("|iex") == "node.exe" or l_0_4:match("([^\\]+)$") == "npm.exe" then
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

