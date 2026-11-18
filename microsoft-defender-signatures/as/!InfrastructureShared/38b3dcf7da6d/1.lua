-- Threat: !InfrastructureShared
-- Name: 38b3dcf7da6d
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].reg_new_value_type == 3 and this_sigattrlog[1].reg_new_value_size > 20000 then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = l_0_0:match("^(.-)\\\\(.-)$")
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  bm.trigger_sig_delayed("BMRegistrySetBinaryData", l_0_0, 3000)
end
return mp.CLEAN
