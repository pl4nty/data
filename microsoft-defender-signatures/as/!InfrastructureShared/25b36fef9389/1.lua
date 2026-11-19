-- Threat: !InfrastructureShared
-- Name: 25b36fef9389
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\tencent\\xwechat\\", 1, true) or string.find(l_0_0, "\\programs\\microsoft vs code\\code.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
