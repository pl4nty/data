-- Threat: !InfrastructureShared
-- Name: 4dd76081396f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
local l_0_2
if l_0_1 then
  l_0_2 = string.match(l_0_1, "wscript.*%s+%\"?%'?(%w:\\.*%.js)")
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = false
local l_0_4 = GetRollingQueue("LuaHighRiskJSinZipWebVector")
if l_0_4 ~= nil and type(l_0_4) == "table" then
  for l_0_5 in pairs(l_0_4) do
    if string.find(l_0_2, l_0_4[l_0_5].key) then
      l_0_3 = true
    end
  end
end
if l_0_3 then
  local l_0_6 = mp.GetParentProcInfo()
  if l_0_6 ~= nil then
    local l_0_7 = string.lower(l_0_6.image_path)
    if l_0_7:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
