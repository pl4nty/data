-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5d71f1cfb7d\1.luac 

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
-- DECOMPILER ERROR at PC27: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

if not ("mshta")("powershell", l_0_2) then
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
  do
    local l_0_5 = {}
    -- DECOMPILER ERROR at PC63: No list found for R4 , SetList fails

    -- DECOMPILER ERROR at PC64: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC65: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC66: Overwrote pending register: R7 in 'AssignReg'

    if not ("hidden")("beacon", "$env:computername") then
      return mp.INFECTED
    end
    do return mp.LOWFI end
    -- WARNING: undefined locals caused missing assignments!
  end
end

