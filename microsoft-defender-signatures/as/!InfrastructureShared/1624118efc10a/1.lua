-- Threat: !InfrastructureShared
-- Name: 1624118efc10a
-- Type: 21

if mp.getfilesize() < 300000 or mp.getfilesize() > 600000 then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[4].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].p1)
  if string.sub(l_0_0, -4) == ".dll" then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(this_sigattrlog[4].p1)
  if string.find(l_0_1, l_0_0) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
