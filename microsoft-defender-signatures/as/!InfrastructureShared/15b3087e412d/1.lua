-- Threat: !InfrastructureShared
-- Name: 15b3087e412d
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -15)):match("\\([^\\]+%.exe)$")
  if l_0_1 == "explorer.exe" then
    local l_0_2 = string.lower(string.sub(mp.ContextualExpandEnvironmentVariables(l_0_0), 2, 11))
    if l_0_2 == ":\\windows\\" then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
