-- Threat: !InfrastructureShared
-- Name: 73b3fbb4f00f
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  local l_0_1 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\"))
  if l_0_0:find(l_0_1, 1, true) then
    return mp.CLEAN
  end
end
bm.trigger_sig("SuspRedirAttempt", "DllDrop")
return mp.CLEAN
