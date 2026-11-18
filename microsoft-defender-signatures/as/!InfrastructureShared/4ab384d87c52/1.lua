-- Threat: !InfrastructureShared
-- Name: 4ab384d87c52
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 ~= nil then
  local l_0_1 = string.match(l_0_0, "\\([^\\]+)\\[^\\]+$")
  if l_0_1 == "adfs" then
    local l_0_2 = string.match(l_0_0, "\\([^\\]+)$")
    local l_0_3 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\SYSTEM32\\"))
    if sysio.IsFileExists(l_0_3 .. l_0_2) then
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
