-- Threat: !InfrastructureShared
-- Name: !#BLKEXC:1081f0b6-3e1e-4f44-acce-816d65112d99
-- Type: 33
-- Includes: HIPSRmmToolInfra

if not mp.IsHipsRuleEnabled("1081f0b6-3e1e-4f44-acce-816d65112d99") then
  return false
end
if versioning.GetTestMode() ~= 53019 then
  local l_0_0 = versioning.GetOrgID()
  if l_0_0 == nil then
    return false
  end
  l_0_0 = string.lower(l_0_0)
  if l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
    return false
  end
end
local l_0_1 = ImageConfig.GetImagePath()
if l_0_1 == nil or l_0_1 == "" then
  return false
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return false
end
l_0_2 = string.lower(l_0_2)
if IsRmmToolFilePath(l_0_2) == true then
  return true
end
if IsRmmToolVersionInfo(l_0_2) == true then
  return true
end
if IsRmmToolOFN(l_0_2) == true then
  return true
end
return false
