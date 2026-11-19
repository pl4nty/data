-- Threat: !InfrastructureShared
-- Name: 84b3487d8e66
-- Type: 21
-- Includes: BMLuaLib

if not IsActiveDirectoryRole() then
  return mp.CLEAN
end
local l_0_0 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\NTDS\\Parameters")
if l_0_0 ~= nil then
  local l_0_1 = sysio.GetRegValueAsString(l_0_0, "DSA Database File")
  if l_0_1 ~= nil then
    local l_0_2 = sysio.GetFileSize(l_0_1)
    if 51200000 < l_0_2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
