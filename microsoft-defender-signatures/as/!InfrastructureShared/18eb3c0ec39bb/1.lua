-- Threat: !InfrastructureShared
-- Name: 18eb3c0ec39bb
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -15)):match("\\([^\\]+%.exe)$")
  if l_0_1 == "explorer.exe" or l_0_1 == "taskhostw.exe" then
    local l_0_2 = string.lower(string.sub(MpCommon.PathToWin32Path(l_0_0), 2, 11))
    if l_0_2 == ":\\windows\\" then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
