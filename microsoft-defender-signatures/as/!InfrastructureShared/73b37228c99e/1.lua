-- Threat: !InfrastructureShared
-- Name: 73b37228c99e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "remote_file_created_taint"
local l_0_1, l_0_2
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p1
  l_0_2 = this_sigattrlog[3].ppid
end
if l_0_1 then
  if isParentPackageManager(l_0_2) then
    return mp.CLEAN
  end
  if isTainted(l_0_1, l_0_0) then
    return mp.INFECTED
  end
end
return mp.CLEAN
