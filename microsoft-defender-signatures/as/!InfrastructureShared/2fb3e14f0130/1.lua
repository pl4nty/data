-- Threat: !InfrastructureShared
-- Name: 2fb3e14f0130
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.len(l_0_0) > 14 then
  l_0_0 = string.lower(string.sub(l_0_0, -14))
  if l_0_0 == "\\mpsigstub.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
