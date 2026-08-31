-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\104bd763e1398a\1.luac 

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
if contains(l_0_3, "powershell") then
  local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_3)
  if l_0_4 then
    return mp.INFECTED
  end
  local l_0_6 = contains
  local l_0_7 = l_0_3
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC74: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R6 in 'AssignReg'

  if l_0_6 then
    return l_0_6
  end
end
do
  local l_0_9 = contains
  local l_0_10 = l_0_3
  do
    local l_0_11 = {}
    -- DECOMPILER ERROR at PC86: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC87: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC88: No list found for R6 , SetList fails

    -- DECOMPILER ERROR at PC92: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC93: Overwrote pending register: R4 in 'AssignReg'

    if l_0_9 then
      return l_0_9
    end
    -- DECOMPILER ERROR at PC95: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC96: Overwrote pending register: R4 in 'AssignReg'

    do return l_0_9 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

