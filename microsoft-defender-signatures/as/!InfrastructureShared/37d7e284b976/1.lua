-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37d7e284b976\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = (l_0_0.image_path):match("([^\\]+)$")
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["cmd.exe"] = true
local l_0_3 = (string.lower)(l_0_1)
if not l_0_2[l_0_3] then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC60: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R7 in 'AssignReg'

local l_0_6 = (("curl").lower)(".msi")
if not containsall(l_0_6, l_0_5) then
  return mp.CLEAN
end
local l_0_7 = {}
-- DECOMPILER ERROR at PC89: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC90: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC92: Overwrote pending register: R9 in 'AssignReg'

local l_0_8 = (("msiexec /i").lower)("msiexec.exe /i")
-- DECOMPILER ERROR at PC95: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC96: Overwrote pending register: R11 in 'AssignReg'

if not contains("http://", "https://") then
  return mp.CLEAN
end
local l_0_9 = (mp.GetParentProcInfo)(l_0_0.ppid)
if isnull(l_0_9) or isnull(l_0_9.ppid) or isnull(l_0_9.image_path) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC127: Overwrote pending register: R12 in 'AssignReg'

local l_0_10 = (l_0_9.image_path):match(" -o ")
if isnull(l_0_10) then
  return mp.CLEAN
end
do
  local l_0_11 = {}
  -- DECOMPILER ERROR at PC141: Overwrote pending register: R13 in 'AssignReg'

  if not l_0_11[(string.lower)(" --output ")] then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

