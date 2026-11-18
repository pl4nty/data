-- Threat: !InfrastructureShared
-- Name: add732294516
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
local l_0_4 = true
local l_0_5 = false
local l_0_6 = false
local l_0_7 = 0
while l_0_7 <= 5 do
  if l_0_7 == 0 then
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
  l_0_3 = string.match(l_0_2, "\\([^\\]+)$")
  if l_0_3 == nil or l_0_3 == "" then
    break
  end
  if l_0_3 == "psexecsvc.exe" or l_0_3 == "wmiprvse.exe" or l_0_3 == "gpscript.exe" or l_0_3 == "winrm.exe" then
    l_0_6 = true
  end
  if l_0_3 == "services.exe" then
    l_0_5 = true
  end
  l_0_7 = l_0_7 + 1
end
if l_0_6 == false or l_0_5 == false then
  return mp.CLEAN
end
return mp.INFECTED
