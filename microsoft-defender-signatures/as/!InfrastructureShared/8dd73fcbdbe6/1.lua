-- Threat: !InfrastructureShared
-- Name: 8dd73fcbdbe6
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
local l_0_4 = true
local l_0_5 = false
local l_0_6 = false
local l_0_7 = false
local l_0_8 = mp.GetScannedPPID()
if l_0_8 == nil then
  return mp.CLEAN
end
local l_0_9 = string.lower(mp.GetProcessCommandLine(l_0_8))
if string.find(l_0_9, " /all", 1, true) then
  l_0_5 = true
end
if string.find(l_0_9, " /oldest", 1, true) then
  l_0_6 = true
end
if string.find(l_0_9, " /shadow=", 1, true) then
  l_0_7 = true
end
if l_0_5 ~= true and (l_0_6 or l_0_7) then
  return mp.CLEAN
end
local l_0_10 = 0
while l_0_10 <= 5 do
  if l_0_10 == 0 then
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
  l_0_9 = mp.GetProcessCommandLine(l_0_1)
  if l_0_9 ~= nil then
    l_0_9 = string.lower(l_0_9)
    local l_0_11 = string.match(l_0_9, "[a-zA-Z] (.+)$")
    if l_0_11 ~= nil and (string.find(l_0_11, ":\\windows", 1, true) or string.find(l_0_11, ":\\program files", 1, true)) then
      return mp.CLEAN
    end
  end
  l_0_3 = string.match(l_0_2, "\\([^\\]+)$")
  if l_0_3 == nil or l_0_3 == "" then
    break
  end
  if l_0_3 == "psexecsvc.exe" or l_0_3 == "wmiprvse.exe" or l_0_3 == "gpscript.exe" or l_0_3 == "svchost.exe" or string.find(l_0_2, ":\\windows\\", 2, true) == nil and string.find(l_0_2, ":\\program files", 2, true) == nil then
    return mp.CLEAN
  end
  if (string.find(l_0_2, "^:\\program files", 2) or string.find(l_0_2, ":\\windows\\system32\\nxtcod.exe", 2, true) or string.find(l_0_2, ":\\windows\\ccm\\", 2, true)) and (string.find(l_0_2, "\\easeus\\easeus partition master\\bin\\", 2, true) or string.find(l_0_2, "\\common files\\mcafee\\systemcore\\", 2, true) or string.find(l_0_2, "\\mcafee\\endpoint security\\threat prevention\\", 2, true) or mp.IsKnownFriendlyFile(l_0_2, true, true) == true) then
    return mp.CLEAN
  end
  l_0_10 = l_0_10 + 1
end
if l_0_10 < 2 then
  return mp.CLEAN
end
return mp.INFECTED
