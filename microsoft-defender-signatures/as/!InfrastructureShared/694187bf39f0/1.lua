-- Threat: !InfrastructureShared
-- Name: 694187bf39f0
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[4].matched and this_sigattrlog[5].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].p1)
  local l_0_1 = string.lower(this_sigattrlog[4].p1)
  local l_0_2 = string.lower(this_sigattrlog[5].p1)
  local l_0_3 = string.lower(this_sigattrlog[5].p2)
  if l_0_0 and string.find(l_0_0, "^(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)$") and l_0_1 and string.find(l_0_1, "^%d%d%d+") and l_0_2 and l_0_3 and string.find(l_0_2, "^%d%d%d+") and string.find(l_0_3, "^(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)$") then
    if peattributes.x86_image then
      if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
        mp.set_mpattribute("do_exhaustivehstr_rescan")
      end
    elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
