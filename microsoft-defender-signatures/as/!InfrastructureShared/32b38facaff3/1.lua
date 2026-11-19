-- Threat: !InfrastructureShared
-- Name: 32b38facaff3
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:find("\\trend micro\\", 1, true) or l_0_0:find("\\smex_master.exe", 1, true) or l_0_0:find("\\windows\\ccm\\ccmexec.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
