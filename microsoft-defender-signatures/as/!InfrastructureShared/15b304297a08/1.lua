-- Threat: !InfrastructureShared
-- Name: 15b304297a08
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(MpCommon.PathToWin32Path(l_0_0), 2, 11))
  if l_0_1 == ":\\windows\\" then
    return mp.CLEAN
  end
end
return mp.INFECTED
