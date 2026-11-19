-- Threat: !InfrastructureShared
-- Name: b2419e339ac2
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[2].matched then
  l_0_0 = nri.GetURI()
end
if l_0_0 ~= "" and string.find(l_0_0, "&X-Rps-CAT=", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
