-- Threat: !InfrastructureShared
-- Name: 33b39502739d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "\\\\(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)\\") then
    return mp.INFECTED
  end
end
return mp.CLEAN
