-- Threat: !InfrastructureShared
-- Name: 8db31bf9680f
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_1 = sysio.GetFileSize(l_0_0)
  if 300000000 < l_0_1 and string.match(l_0_0, ".:\\[^\\]+.exe$") then
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
