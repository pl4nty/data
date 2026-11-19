-- Threat: !InfrastructureShared
-- Name: 21d704b1501b
-- Type: 21
-- Includes: BMLuaLib, HvaLookupHelpers

if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
if #l_0_1 < 20 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:sub(1, 256)
local l_0_3 = {
  powershell = true,
  POWERSHELL = true,
  Powershell = true,
  PowerShell = true,
  powerShell = true,
  POWERshell = true,
  powerSHELL = true,
  PowerSHELL = true,
  powershELL = true,
  POwershell = true
}
local l_0_4 = l_0_2:lower()
local l_0_5 = "powershell"
local l_0_6 = #l_0_5
local l_0_7 = 1
while true do
  local l_0_8 = l_0_4:find(l_0_5, l_0_7, true)
  if not l_0_8 then
    return mp.CLEAN
  end
  local l_0_9 = l_0_2:sub(l_0_8, l_0_8 + l_0_6 - 1)
  if not l_0_3[l_0_9] then
    return mp.INFECTED
  end
  l_0_7 = l_0_8 + l_0_6
end
return mp.CLEAN
