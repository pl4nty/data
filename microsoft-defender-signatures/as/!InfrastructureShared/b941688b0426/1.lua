-- Threat: !InfrastructureShared
-- Name: b941688b0426
-- Type: 21

if peattributes.no_security and this_sigattrlog[4].matched and this_sigattrlog[7].matched then
  local l_0_0 = string.lower(this_sigattrlog[4].p1)
  local l_0_1 = string.lower(this_sigattrlog[7].p1)
  local l_0_2 = string.lower(this_sigattrlog[7].p2)
  if l_0_0:match("^/%w$") and l_0_1:match("^%.%w+$") and l_0_2:match("^%w+$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
