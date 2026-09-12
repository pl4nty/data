-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8ad7848f0aae\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.len)(l_0_1) > 350 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (string.gsub)(l_0_1, "powershell", "")
if l_0_3 < 2 then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC51: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC52: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R7 in 'AssignReg'

if not (" iex")("invoke-expression", "iwr") then
  return mp.CLEAN
end
local l_0_5 = (string.match)(l_0_1, "join%-path%s+%$env:temp%s+\'([%w%-%_]+%.ps1)\'")
if not l_0_5 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC74: Overwrote pending register: R8 in 'AssignReg'

do
  local l_0_6 = (string.match)(l_0_1, "invoke-webrequest")
  if not l_0_6 then
    return mp.CLEAN
  end
  if l_0_5 ~= l_0_6 then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

