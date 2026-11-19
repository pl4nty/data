-- Threat: !InfrastructureShared
-- Name: 8dd7e7210f99
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
local l_0_4 = true
local l_0_5 = false
local l_0_6 = false
local l_0_7 = false
local l_0_8 = false
local l_0_9 = mp.GetScannedPPID()
if l_0_9 == nil then
  return mp.CLEAN
end
local l_0_10 = string.lower(mp.GetProcessCommandLine(l_0_9))
if string.find(l_0_10, " /all", 1, true) then
  l_0_5 = true
end
if string.find(l_0_10, " /oldest", 1, true) then
  l_0_6 = true
end
if string.find(l_0_10, " /shadow=", 1, true) then
  l_0_7 = true
end
if l_0_5 ~= true and (l_0_6 or l_0_7) then
  return mp.CLEAN
end
local l_0_11 = 0
while l_0_11 <= 5 do
  if l_0_11 == 0 then
    l_0_4, l_0_0 = pcall(mp.GetParentProcInfo)
  else
    l_0_4, l_0_0 = pcall(mp.GetParentProcInfo, l_0_1)
  end
  if l_0_4 ~= true or l_0_0 == nil then
    break
  end
  l_0_1 = l_0_0.ppid
  if l_0_1 == nil then
    break
  end
  l_0_2 = l_0_0.image_path
  if l_0_2 == nil then
    break
  end
  l_0_2 = string.lower(l_0_2)
  l_0_10 = mp.GetProcessCommandLine(l_0_1)
  if l_0_10 ~= nil then
    l_0_10 = string.lower(l_0_10)
    local l_0_12 = string.match(l_0_10, "[a-zA-Z] (.+)$")
    if l_0_12 ~= nil and (string.find(l_0_12, ":\\windows", 1, true) or string.find(l_0_12, ":\\program files", 1, true)) then
      return mp.CLEAN
    end
  end
  l_0_3 = string.match(l_0_2, "\\([^\\]+)$")
  if l_0_3 == nil or l_0_3 == "" then
    break
  end
  if string.find(l_0_2, ":\\windows\\", 2, true) == nil and string.find(l_0_2, ":\\program files", 2, true) == nil then
    l_0_8 = true
    break
  end
  l_0_11 = l_0_11 + 1
end
if l_0_8 == false then
  return mp.CLEAN
end
return mp.INFECTED
