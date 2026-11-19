-- Threat: !InfrastructureShared
-- Name: 2eb3c3aee392
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -14))
  if l_0_1 == "\\gvfs\\gvfs.exe" then
    return mp.CLEAN
  end
  l_0_1 = string.lower(string.sub(l_0_0, -36))
  if l_0_1 == "\\urbrowser\\application\\urbrowser.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
