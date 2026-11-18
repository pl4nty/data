-- Threat: !InfrastructureShared
-- Name: 2db36b97237e
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -35))
  if l_0_0 == "\\ahnlab\\safe transaction\\asdsvc.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
