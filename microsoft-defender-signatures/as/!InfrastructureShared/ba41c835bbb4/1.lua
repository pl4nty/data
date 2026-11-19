-- Threat: !InfrastructureShared
-- Name: ba41c835bbb4
-- Type: 21

if peattributes.isdll then
  return mp.CLEAN
end
if this_sigattrlog[2].matched then
  local l_0_0 = string.lower(this_sigattrlog[2].p1)
  if string.find(l_0_0, "data source=%w%w[%w%.%-]+") and string.find(l_0_0, "user id=%p?%w...+;") and string.find(l_0_0, "password=%p?%w%w%w.+") then
    return mp.INFECTED
  end
end
return mp.CLEAN
