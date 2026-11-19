-- Threat: !InfrastructureShared
-- Name: 19b3707fb9e8
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -13))
  if l_0_0 == "\\wmiprvse.exe" then
    return mp.CLEAN
  end
end
local l_0_1
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].np2
end
if l_0_1 == nil or mp.bitand(l_0_1, 42) == 0 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
return mp.INFECTED
