-- Threat: !InfrastructureShared
-- Name: 2014177f443c7
-- Type: 21

if peattributes.no_security and this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].p1)
  if 16 == #l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
