-- Threat: !InfrastructureShared
-- Name: 1db3e7b361b8
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if l_0_0 ~= nil and string.find(l_0_0, "\\services.exe\\", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
