-- Threat: !InfrastructureShared
-- Name: 83b3f758de40
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  local l_0_1 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\"))
  if l_0_0:find(l_0_1, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
