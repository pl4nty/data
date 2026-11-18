-- Threat: !InfrastructureShared
-- Name: 25b3eb2cb32a
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.sub(l_0_0, -29) ~= "\\windows defender\\msascui.exe" and string.sub(l_0_0, -38) ~= "\\microsoft security client\\msseces.exe" and string.sub(l_0_0, -42) ~= "\\microsoft security essentials\\msseces.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
