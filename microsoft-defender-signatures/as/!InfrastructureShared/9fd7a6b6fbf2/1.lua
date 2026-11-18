-- Threat: !InfrastructureShared
-- Name: 9fd7a6b6fbf2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if #l_0_1 <= 60 then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
local l_0_2 = {
  ".shop/",
  ".xyz/",
  ".icu/",
  ".lat/",
  ".fun/",
  ".bet/",
  ".live/",
  ".life/",
  ".online/",
  ".bond/",
  ".top/",
  ".world/",
  ".click/",
  ".forest/",
  ".info/",
  ".run/",
  ".was/",
  ".today/",
  ".cyou/"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil and l_0_3.image_path ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  if l_0_4:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.LOWFI
