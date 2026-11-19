-- Threat: !InfrastructureShared
-- Name: 13141fcbda890
-- Type: 21

if this_sigattrlog[13].matched and this_sigattrlog[14].matched then
  local l_0_0 = string.lower(this_sigattrlog[13].p1)
  local l_0_1 = string.lower(this_sigattrlog[14].p1)
  if l_0_0 and string.find(l_0_0, "^(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)$") and l_0_1 and string.len(l_0_1) > 24 and string.find(l_0_1, "^/[%w/_%-=]+$") then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
