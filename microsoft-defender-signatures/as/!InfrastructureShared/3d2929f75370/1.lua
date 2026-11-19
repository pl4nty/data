-- Threat: !InfrastructureShared
-- Name: 3d2929f75370
-- Type: 21

local l_0_0 = mp.getfilesize()
if not (l_0_0 and not (1024000 < l_0_0) and headerpage) or #headerpage > 4096 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
l_0_1 = mp.GetNormalizedScript(l_0_1)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "ordereddictclass[a-z]+%d%d%d?:")
if l_0_2 == nil or #l_0_2 < 30 then
  return mp.CLEAN
end
l_0_2 = string.match(l_0_1, "%%len%([a-z]+%d%d%d?%)%]%)%%")
if l_0_2 and 30 < #l_0_2 then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
