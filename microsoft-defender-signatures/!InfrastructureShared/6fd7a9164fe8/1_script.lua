-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6fd7a9164fe8\1_luac 

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
local l_0_2 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = ""
  local l_1_2 = ""
  local l_1_3 = 1
  local l_1_4 = 1
  while 1 do
    l_1_3 = (string.find)(l_1_0, "%[char%]%((%d+)%)", l_1_4)
    if not l_1_3 then
      break
    end
    l_1_1 = l_1_1 .. (string.char)(tonumber(l_1_2))
  end
  return l_1_1
end

if (string.find)(l_0_1, "%[char%]%(%d+%)") then
  local l_0_3 = l_0_2(l_0_1)
  if l_0_3 == "" then
    return mp.CLEAN
  end
  l_0_3 = (string.lower)(l_0_3)
  if (string.find)(l_0_3, "http", 1, true) and (string.find)(l_0_3, "start-process", 1, true) then
    local l_0_4 = contains
    local l_0_5 = l_0_3
    local l_0_6 = {}
    -- DECOMPILER ERROR at PC64: No list found for R6 , SetList fails

    -- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

    if l_0_4 then
      return l_0_4
    end
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

