-- Threat: !InfrastructureShared
-- Name: 15b34296ad03
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.sub(l_0_0, -11) == "wscript.exe" or string.sub(l_0_0, -11) == "cscript.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
