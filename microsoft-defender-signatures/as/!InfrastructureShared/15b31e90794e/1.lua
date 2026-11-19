-- Threat: !InfrastructureShared
-- Name: 15b31e90794e
-- Type: 21

local l_0_0 = bm.get_imagepath()
if mp.IsKnownFriendlyFile(l_0_0, true, true) == true then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_1 = {
    ["werfault.exe"] = true,
    ["svchost.exe"] = true,
    ["wmiprvse.exe"] = true,
    ["explorer.exe"] = true
  }
  local l_0_2 = string.lower(string.sub(l_0_0, -15)):match("\\([^\\]+%.exe)$")
  if l_0_1[l_0_2] then
    local l_0_3 = string.lower(string.sub(MpCommon.PathToWin32Path(l_0_0), 2, 11))
    if l_0_3 == ":\\windows\\" then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
