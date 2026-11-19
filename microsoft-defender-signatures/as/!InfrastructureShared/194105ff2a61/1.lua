-- Threat: !InfrastructureShared
-- Name: 194105ff2a61
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].p1 ~= nil then
  local l_0_0 = this_sigattrlog[1].p1
  if 50 < #l_0_0 then
    if 100 < #l_0_0 then
      if string.match(l_0_0, "%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w") then
        mp.set_mpattribute("//JAVATTR:JavaLongFunctionName100")
      end
    elseif string.match(l_0_0, "%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w") then
      mp.set_mpattribute("//JAVATTR:JavaLongFunctionName50")
    end
  end
end
return mp.CLEAN
