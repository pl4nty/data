-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35d7ff4e3cdb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC36: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R5 in 'AssignReg'

if not ("c:\\")("d:\\", "e:\\") then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC49: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC60: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

if not (".docx")(".pdf", "f:\\") then
  return mp.CLEAN
end
local l_0_4 = (mp.GetParentProcInfo)()
do
  do
    if l_0_4 ~= nil and l_0_4.image_path ~= nil then
      local l_0_5 = (string.lower)(l_0_4.image_path)
      -- DECOMPILER ERROR at PC82: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC83: Overwrote pending register: R8 in 'AssignReg'

      if l_0_5:match("h:\\") == "explorer.exe" then
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

