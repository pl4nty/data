-- Threat: !InfrastructureShared
-- Name: 9841610aa61a
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if this_sigattrlog[5].matched and this_sigattrlog[6].matched then
  local l_0_0 = this_sigattrlog[5].p1
  local l_0_1 = this_sigattrlog[6].p1
  if l_0_0 .. l_0_1 == "unsafe" then
    return mp.INFECTED
  end
end
return mp.LOWFI
