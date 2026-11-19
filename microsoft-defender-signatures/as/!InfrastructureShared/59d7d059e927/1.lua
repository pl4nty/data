-- Threat: !InfrastructureShared
-- Name: 59d7d059e927
-- Type: 21
-- Includes: Path

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.image_path and string.lower(l_0_0.image_path)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetOriginalFileName(l_0_1)
if l_0_2 == nil and #l_0_2 <= 10 then
  return mp.CLEAN
end
if string.lower(l_0_2) == "bm_renpy_exe" then
  return mp.INFECTED
end
return mp.CLEAN
