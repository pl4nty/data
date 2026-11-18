-- Threat: !InfrastructureShared
-- Name: aa29a8be1bca
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 and string.find(string.lower(l_0_0), "\\servicing\\packages\\microsoft%-windows%-client%-desktop%-required%-package.+%.mum") then
  mp.set_mpattribute("SelectableWinDefendPkgInServicing")
end
return mp.CLEAN
