-- Threat: !InfrastructureShared
-- Name: 55d77e32bd13
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  local l_0_3 = string.sub(l_0_2, -15):match("\\([^\\]+)$")
  local l_0_4 = {
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["powerpnt.exe"] = true,
    ["outlook.exe"] = true
  }
  if l_0_4[l_0_3] then
    return mp.INFECTED
  end
end
return mp.CLEAN
