-- Threat: !InfrastructureShared
-- Name: 19b30d706951
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -19) == "\\browser_broker.exe" or string.sub(l_0_0, -13) == "\\explorer.exe" then
  return mp.CLEAN
end
return mp.INFECTED
