-- Threat: !InfrastructureShared
-- Name: 6fd7a9164fe8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  local l_1_1 = ""
  local l_1_2 = ""
  local l_1_3 = 1
  local l_1_4 = 1
  while true do
    l_1_3, l_1_4, l_1_2 = string.find(l_1_0, "%[char%]%((%d+)%)", l_1_4)
    if not l_1_3 then
      break
    end
    l_1_1 = l_1_1 .. string.char(tonumber(l_1_2))
  end
  return l_1_1
end

if string.find(l_0_1, "%[char%]%(%d+%)") then
  local l_0_3 = l_0_2(l_0_1)
  if l_0_3 == "" then
    return mp.CLEAN
  end
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_3, "http", 1, true) and string.find(l_0_3, "start-process", 1, true) and contains(l_0_3, {
    "-w 1",
    "-w h",
    "hidden"
  }) then
    return mp.INFECTED
  end
end
return mp.CLEAN
