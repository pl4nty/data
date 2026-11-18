-- Threat: !InfrastructureShared
-- Name: 25b36b7171a0
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0:len() >= 12 then
  local l_0_1 = string.sub(l_0_0, -12)
  if l_0_1 == "ie4uinit.exe" or l_0_1 == "iexplore.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
