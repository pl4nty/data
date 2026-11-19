-- Threat: !InfrastructureShared
-- Name: 32b38264c7a7
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\skype.mdn.mp.service.exe", 1, true) or string.find(l_0_0, "\\microsoft.skype.", 1, true)) then
  return mp.CLEAN
end
bm.trigger_sig("SpringShellExpl", "EncodedPost")
return mp.CLEAN
