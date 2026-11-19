-- Threat: !InfrastructureShared
-- Name: b5b31905a562
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -18) == "\\processhacker.exe" then
  return mp.CLEAN
end
return mp.INFECTED
