-- Threat: !InfrastructureShared
-- Name: 49b3fbb794bc
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.sub(l_0_0, -12) == "rundll32.exe" or string.sub(l_0_0, -11) == "notepad.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
