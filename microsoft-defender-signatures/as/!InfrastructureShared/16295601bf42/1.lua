-- Threat: !InfrastructureShared
-- Name: 16295601bf42
-- Type: 21

local l_0_0 = mp.getfilename():lower()
if mp.get_mpattribute("BM_RTF_FILE") == true and string.find(l_0_0, ".rtf", -4, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
